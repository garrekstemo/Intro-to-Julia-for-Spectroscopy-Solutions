function lorentz(x, p)
    A, Γ, x0 = p
    h = @. (x - x0) / (Γ/2)
    @. A / (1 + h^2)
end

A, Γ, x0 = 1, 28, 510
xdata = 400:1:650
ydata = lorentz(xdata, [A, Γ, x0]) + 0.08 * randn(length(xdata))

p0 = [0.5, 10, 500]  # initial guess for parameters
fit = curve_fit(lorentz, xdata, ydata, p0)
params = fit.param  # access the fit results
sigma = stderror(fit)  # access the standard error of the fit


f = Figure()

ax1 = Axis(f[1, 1])
scatter!(xdata, ydata .- lorentz(xdata, fit.param), label = "residuals")

ax2 = Axis(f[2, 1], xlabel = "Wavelength (nm)", ylabel = "Absorbance")
scatter!(xdata, ydata, color=:tomato, label = "data")
lines!(xdata, lorentz(xdata, fit.param), linewidth=2, label = "fit")
text!("FWHM = ($(round(params[2])) ± $(round(sigma[2]))) nm", position = (400, 0.7))

axislegend(ax2)
f

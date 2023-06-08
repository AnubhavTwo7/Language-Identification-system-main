function glot =gvv(signal)
lpr=lp_res(signal);
glot=cumtrapz(lpr);

end
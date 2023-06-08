function res = lp_res(sig)
    % LPC analysis
    fil=filter([1, -1], 1, sig);
    Lsig = length(sig);
    OrderLPC =10;         %order of LPC
    Win = hanning(Lsig);  %hanning window
    sigLPC = Win.*fil;
    r =  xcorr(sigLPC); 
    r = r./max(abs(r));
    a=lpc(sigLPC,OrderLPC);               % LPC coefficients
    y_hat = filter([0 -1*a(2:end)],1,sigLPC); % inverse filter
    res=sigLPC-y_hat;
    return
end
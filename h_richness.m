
function hrf = h_richness(x,fs)
frame=frames(x,0.02*fs);
hrf=[];
[~,col]=size(frame);
for u =1:col
    fft_signal=fft(frame(:,u));

    [~, argindex] = max(abs(fft_signal));
    f0=fs/argindex;


    % find the number of harmonics
    N = floor(fs/(f0));


    % calculate the harmonic frequencies
    harmonic_freq = f0*(1:N);

    % calculate the harmonic indices
    harmonic_index =round(fs./harmonic_freq);


    % % calculate the harmonic power spectrum
    for q=1:length(harmonic_freq)
        harmonic_amplitudes(:,q)=abs(fft_signal(harmonic_index(q)));
    end
    % calculate the total power spectrum
    total_ps = sum(harmonic_amplitudes);
    %
    % % calculate the harmonic richness factor
    hrf(u,:) = total_ps/max(harmonic_amplitudes);

end
end
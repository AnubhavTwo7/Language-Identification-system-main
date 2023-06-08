
function H1_H2 = h_diff(x,fs)


frame=frames(x,0.02*fs);
H1_H2=[];
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
    if(length(harmonic_amplitudes)<=1)
        H1_H2(u,:)=harmonic_amplitudes(harmonic_index);
    else
        H1_H2(u,:)=-diff(maxk(harmonic_amplitudes,2));
    end

end
end
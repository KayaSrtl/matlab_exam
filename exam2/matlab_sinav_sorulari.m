% Soru 1
% Rijit bir basit sarkaç aşağıdaki şekilde verildiği üzere dönme noktasından sürtünmesiz bir şekilde sarkıtılmıştır.
% Sarkacın ileri geri belirli bir atalet ile salındığını düşünürsek, frekansı aşağıdaki eşitlik ile bulabiliriz.
% (f: frekans; m: sarkacın kütlesi; g: yer çekimi ivmesi; L: dönme noktası ile sarkacın ağırlık merkezi arasındaki mesafe; I: atalet).
% MATLAB’ın sembolik komutunu kullanarak bu denklemi L için çözünüz.

syms f g m I L  % Denklemdeki semboller öncelikle tanımlanıyor.

denklem = (2*pi*f)^2 * I == m*g*L; % Denklem yazılarak denklem isimli bir değişkene atanıyor.

L = solve(denklem, L)  % L türünden denklem çözülüyor.

%%
% Soru 2
% Piston – silindir sisteminde sabit sıcaklıkta hacim değişimi ile ölçülen basınç değerleri aşağıdaki tabloda verilmiştir. 
% Buna göre:
% a. Lineer interpolasyonu kullanarak 4,8 m3 hacim değerine karşılık gelen basıncı bulunuz.
% b. Kübik eğri interpolasyonunu (Cubic spline interpolation) kullanarak 4,8 m3 hacim değerine karşılık gelen basıncı bulunuz.
% c. Lineer interpolasyonu kullanarak 900 kPa basınç değerine karşılık gelen hacim değerini bulunuz.
% d. Kübik eğri interpolasyonunu (Cubic spline interpolation) kullanarak 900 kPa basınç değerine karşılık gelen hacim değerini bulunuz.

% Tablodaki verileri işlemek üzere giriyoruz.
hacimdegerleri = [1 2 3 4 5 6]; % Hacim değerlerini diziye yazıyoruz.
basincdegerleri = [2494 1247 831 623 499 416]; % Basinç değerlerini diziye yazıyoruz.
a_2_lineer_interpolasyon = interp1(hacimdegerleri, basincdegerleri, 4.8, 'linear'); %doğrusal interpolasyon işlemi ile 4.8 m^3 hacime denk gelen değer bulunuyor.
disp(a_2_lineer_interpolasyon); %Bulunan değer ekrana yazdırılıyor. Bu değer ikinci sorunun a şıkkının çıktısı.

b_2_kubik_interpolasyon = interp1(hacimdegerleri, basincdegerleri, 4.8, 'spline'); %Kübik interpolasyon işlemi ile 4.8 m^3 hacime denk gelen değer bulunuyor.
disp(b_2_kubik_interpolasyon); %Bulunan değer ekrana yazdırılıyor. Bu değer ikinci sorunun b şıkkının çıktısı.


c_2_lineer_interpolasyon = interp1(basincdegerleri, hacimdegerleri, 900, 'linear'); %Doğrusal interpolasyon işlemi ile 900 kPa basınca denk gelen değer bulunuyor.
disp(c_2_lineer_interpolasyon); %Bulunan değer ekrana yazdırılıyor. Bu değer ikinci sorunun c şıkkının çıktısı.


d_2_kubik_interpolasyon = interp1(basincdegerleri, hacimdegerleri, 900, 'spline'); %Kübik interpolasyon işlemi ile 900 kPa basınca denk gelen değer bulunuyor.
disp(d_2_kubik_interpolasyon); %Bulunan değer ekrana yazdırılıyor. Bu değer ikinci sorunun d şıkkının çıktısı.
%%
% Soru 3
% Yukarıda verilen tablodaki değerler için (2. soru) polyfit komutunu kullanarak birinci, ikinci, üçüncü ve dördüncü dereceden polinomlar için eğri uydurunuz.
% Hesapları 0,1 m3 değerindeki artışlar için yapınız.

% Tablodaki verileri işlemek üzere giriyoruz.
soru2hacimdegerleri = [1 2 3 4 5 6]; % Hacim değerlerini diziye yazıyoruz.
soru2basincdegerleri = [2494 1247 831 623 499 416]; % Basinç değerlerini matrise yazıyoruz.


p1 = polyfit(soru2hacimdegerleri, soru2basincdegerleri, 1) % 1. dereceden polinom için eğri uydurma yaptık.
p2 = polyfit(soru2hacimdegerleri, soru2basincdegerleri, 2) % 2. dereceden polinom için eğri uydurma yaptık.
p3 = polyfit(soru2hacimdegerleri, soru2basincdegerleri, 3) % 3. dereceden polinom için eğri uydurma yaptık.
p4 = polyfit(soru2hacimdegerleri, soru2basincdegerleri, 4) % 4. dereceden polinom için eğri uydurma yaptık.


x_degerleri = 0:0.1:6; % Hesaplar için 0.1 m^3 değerindeki artışlar ile hacim değerleri oluşturduk.

y_degerleri1 = polyval(p1, x_degerleri);% Uydurulan 1. derece denklem için sonuç değerlerini oluşturuyoruz.
y_degerleri2 = polyval(p2, x_degerleri);% Uydurulan 2. derece denklem için sonuç değerlerini oluşturuyoruz.
y_degerleri3 = polyval(p3, x_degerleri);% Uydurulan 3. derece denklem için sonuç değerlerini oluşturuyoruz.
y_degerleri4 = polyval(p4, x_degerleri);% Uydurulan 4. derece denklem için sonuç değerlerini oluşturuyoruz.


subplot(2, 2, 1); % Grafikleri birbirinden ayırmak için 4 grafiklik alan oluşturup 1. bölgesini seçtik.
plot(x_degerleri, y_degerleri1, 'm'); % 1. dereceden polinomun grafiğini çizerek gösterdik.
title('1. Dereceden Uydurulmuş Polinom'); %Grafiğin başlığını belirledik.
xlabel('Hacim Değerleri (m^3)'); %Grafiğin x etketini belirledik.
ylabel('Basınç Değerleri (kPa)'); %Grafiğin y etketini belirledik.


subplot(2, 2, 2); % Grafikleri birbirinden ayırmak için 4 grafiklik alan oluşturup 2. bölgesini seçtik.
plot(x_degerleri, y_degerleri2, 'r'); % 2. dereceden polinomun grafiğini çizerek gösterdik.
title('2. Dereceden Uydurulmuş Polinom'); %Grafiğin başlığını belirledik.
xlabel('Hacim Değerleri (m^3)'); %Grafiğin x eksenin etketini belirledik.
ylabel('Basınç Değerleri (kPa)'); %Grafiğin y eksenin etketini belirledik.


subplot(2, 2, 3); % Grafikleri birbirinden ayırmak için 4 grafiklik alan oluşturup 3. bölgesini seçtik.
plot(x_degerleri, y_degerleri3, 'g'); % 3. dereceden polinomun grafiğini çizerek gösterdik.
title('3. Dereceden Uydurulmuş Polinom'); %Grafiğin başlığını belirledik.
xlabel('Hacim Değerleri (m^3)'); %Grafiğin x eksenin etketini belirledik.
ylabel('Basınç Değerleri (kPa)'); %Grafiğin y eksenin etketini belirledik.


subplot(2, 2, 4); % Grafikleri birbirinden ayırmak için 4 grafiklik alan oluşturup 4. bölgesini seçtik.
plot(x_degerleri, y_degerleri4, 'b'); %4. dereceden polinomun grafiğini çizerek gösterdik.
title('4. Dereceden Uydurulmuş Polinom'); %Grafiğin başlığını belirledik.
xlabel('Hacim Değerleri (m^3)'); %Grafiğin x eksenin etketini belirledik.
ylabel('Basınç Değerleri (kPa)'); %Grafiğin y eksenin etketini belirledik.
%%
% Soru 4
% Aşağıdaki diferansiyel denklemi zaman (t) 0 – 4 aralığı için çözünüz. Başlangıç koşulu olarak t=0 değerinde y’yi 1 olarak alınız.
% a. Analitik olarak veya MATLAB’ın sembolik komutu ile çözünüz.
% b. ode45 fonksiyonu ile çözünüz.

dydt = @(t, y) 1 - sin(t); % Diferansiyel denklemi tanımlama işlemini yaptık.


y0 = 1; % Başlangıç koşulunu belirledik.


zamanaraligi = [0, 4]; % Zaman aralığını belirledik.


[t, y] = ode45(dydt, zamanaraligi, y0); % ode45 fonksiyonu ile Diferansiyel denklemi çözme işlemi yaptık


plot(t, y); % Çözümün grafiğini çizerek görsterdik.
xlabel('t');  %Grafiğin x eksenin etketini belirledik.
ylabel('y(t)'); %Grafiğin y eksenin etketini belirledik.
title('Diferansiyel Denklemin ode45() Fonksiyonu ile Çözümü'); %Grafiğin başlığını belirledik.
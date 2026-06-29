#import "config.typ": *

== Verteilungen
#align(center)[
  #table(
    columns: (2fr, 0.8fr, 1.1fr, 0.7fr, 1fr, 1.2fr, 1.2fr),
    align: (left, center, center, center, center, center, center).map(a => a + horizon),
    stroke: 0.5pt + luma(150),
    inset: 0.8em,

    fill: (col, row) => {
      if row == 0 {
        rgb("e0e0e0")
      } else if row <= 7 {
        rgb("e6f2ff")
      } else {
        rgb("ffe6e6")
      }
    },

    [*Verteilung*], [*Notation*], [*Parameter*], [*$E[X]$*], [*$Var(X)$*], [*$p_X (t)$ bzw. $f_X (t)$*], [*$F_X (t)$*],

    [Gleichverteilung (diskret) #minitext()[Alle Ereignisse gleich wahrscheinlich]],
    [unbekannt],
    [$n$: Anzahl Ereignisse \ $x_i$: Ereignis],
    [$1/n sum x_i$],
    [$1/n sum x_i^2 - (sum x_i / n)^2$],
    [$1/n$],
    [$(|{k: x_k <= t}|)/n$],

    [Bernoulli #minitext()[Einmaliges Ja/Nein-Experiment]],
    [$Ber(p)$],
    [$p$: ErfolgsW'keit],
    [$p$],
    [$p(1-p)$],
    [$p^t(1-p)^(1-t)$],
    [$1-p$ für $0 <= t < 1$],

    [Binomial #minitext()[Anzahl Erfolge bei $n$ Versuchen]],
    [$Bin(n, p)$],
    [$n$: Versuche \ $p$: ErfolgsW'keit],
    [$n p$],
    [$n p(1-p)$],
    [$binom(n, t) p^t (1-p)^(n-t)$],
    [$sum_(k=0)^t binom(n, k) p^k (1-p)^(n-k)$],

    [Geometrisch #minitext()[Wartezeit bis zum ersten Erfolg]],
    [$Geo(p)$],
    [$p$: ErfolgsW'keit],
    [$1/p$],
    [$(1-p)/p^2$],
    [$p(1-p)^(t-1)$],
    [$1 - (1-p)^t$],

    [Poisson #minitext()[Anzahl Ereignisse pro Zeitintervall]],
    [$Poisson(lambda)$],
    [$lambda$: Erwartungswert und Varianz],
    [$lambda$],
    [$lambda$],
    [$lambda^t / (t!) e^(-lambda)$],
    [$e^(-lambda) sum_(k=0)^t lambda^k / (k!)$],

    [Negativbinomial #minitext()[Versuche bis zum $r$-ten Erfolg]],
    [$NBin(r, p)$],
    [$r in NN, p in [0,1]$],
    [$r/p$],
    [$r(1-p)/p^2$],
    [$binom(k-1, r-1) p^r (1-p)^(k-r)$],
    [zu kompliziert],

    [Hypergeometrisch #minitext()[Stichprobenziehen ohne Zurücklegen]],
    [$H(n,r,m)$],
    [$n in NN$, $m, r in {1,..,n}$],
    [$m r / n$],
    [$m r / n (1-r/n) (n-m)/(n-1)$],
    [$binom(r, k) binom(n-r, m-k)/binom(n, m)$],
    [$sum_(y=0)^k binom(r, y) binom(n-r, m-y)/binom(n, m)$],

    [Gleichverteilung (stetig) #minitext()[Konstante Dichte im Intervall]],
    [$cal(U)([a,b])$],
    [$[a,b]$: Intervall],
    [$(a+b)/2$],
    [$(b-a)^2/12$],
    [$cases(1/(b-a) & a <= x <= b, 0 & "sonst")$],
    [$cases(0 & x <= a, (t-a)/(b-a) & a < x < b, 1 & x >= b)$],

    [Exponentialverteilung #minitext()[Dauer zwischen zufälligen Ereignissen]],
    [$Exp(lambda)$],
    [$lambda: 1/E[X]$],
    [$1/lambda$],
    [$1/lambda^2$],
    [$cases(lambda e^(-lambda t) & t >= 0, 0 & t < 0)$],
    [$cases(1-e^(-lambda t) & t > 0, 0 & t <= 0)$],

    [Normalverteilung #minitext()[Symmetrische Streuung um Mittelwert]],
    [$cal(N)(mu, sigma^2)$],
    [$mu$: Erwartungswert \ $sigma^2$: Varianz],
    [$mu$],
    [$sigma^2$],
    [$1/sqrt(2 pi sigma^2) e^(-(t-mu)^2/(2 sigma^2))$],
    [$1/(sigma sqrt(2 pi)) integral_(-oo)^t e^(-1/2((y-mu)/sigma)^2) dif y$],

    [$chi^2$-Verteilung #minitext()[Summe quadrierter Normalverteilungen]],
    [$chi_m^2$],
    [$n$: Freiheitsgrad],
    [$n$],
    [$2n$],
    [$1/(2^(n/2) Gamma(n/2)) t^(n/2-1) e^(-t/2)$ ($t>0$)],
    [$P(n/2, t/2)$],

    [$t$-Verteilung #minitext()[Mittelwertschätzung kleiner Stichproben]],
    [$t_m$],
    [$n$: Freiheitsgrad],
    [$cases(0 & n>1, "undef." & "sonst")$],
    [$cases(n/(n-2) & n>2, oo & 1<n<=2, "undef." & "sonst")$],
    [$Gamma((n+1)/2)/(sqrt(n pi) Gamma(n/2)) (1+t^2/n)^(-(n+1)/2)$],
    [zu kompliziert],

    [Cauchy Verteilung #minitext()[Verteilung mit extremen Ausreissern]],
    [$Cauchy(x_0, gamma)$],
    [$x_0 in RR, gamma > 0$],
    [Existiert nicht],
    [Existiert nicht],
    [$1/pi gamma / (gamma^2 + (x-x_0)^2)$],
    [$1/2 + 1/pi arctan((x-x_0)/gamma)$],
  )
]



#columns(3, gutter: 1cm)[
  #subbox(title: "Binomischer Lehrsatz")[
    $
      (x + y)^n & = sum_(k=0)^n binom(n, k) x^(n-k) y^k quad "mit:" quad binom(n, k) = n! / (k! (n-k)!) \
                & = sum_(k=0)^n binom(n, k) x^k y^(n-k)
    $
  ]
  #colbreak()
  #subbox(title: "Geometrische Reihe")[
    Für $alpha < 1$:
    $ sum_(n=0)^oo alpha^n = 1 / (1 - alpha) $
  ]
  #colbreak()
  #subbox(title: "Cauchy Produkt")[
    Falls $sum_(n=0)^oo a_n$ und $sum_(n=0)^oo b_n$ absolut konvergieren, dann:
    $
      sum_(n=0)^oo sum_(k=0)^n a_k b_(n-k) = sum_(n=0)^oo sum_(i+j=n) a_i b_j = (sum_(n=0)^oo a_n) · (sum_(k=0)^oo b_k)
    $
  ]
]

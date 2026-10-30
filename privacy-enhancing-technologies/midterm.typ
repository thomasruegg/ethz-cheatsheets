// ============================================================================
// PRIVACY ENHANCING TECHNOLOGIES (PETs) - ULTIMATE MIDTERM CHEATSHEET
// Merged & Expanded Edition (Lectures 1-19 + All Homeworks + T/F Exam Bank)
// Compile with: typst compile pets_midterm_cheatsheet.typ
// ============================================================================

#set page(
  paper: "a4",
  margin: (x: 0.45cm, y: 0.45cm),
  columns: 3,
  flipped: true,
)
#set text(font: "New Computer Modern", size: 6pt)
#set par(leading: 0.34em, justify: true, spacing: 0.42em)

// Color Palette for Panic-Mode Scannability
#let c-def-bg = rgb("#eef5ff")
#let c-def-bd = rgb("#1d4ed8")
#let c-hw-bg  = rgb("#f5f0ff")
#let c-hw-bd  = rgb("#6d28d9")
#let c-dia-bg = rgb("#ecfdf5")
#let c-dia-bd = rgb("#047857")
#let c-tf-bg  = rgb("#fff1f2")
#let c-tf-bd  = rgb("#be123c")
#let c-sec-bg = rgb("#1e293b")

#let sec-hdr(title) = block(
  fill: c-sec-bg,
  inset: (x: 4pt, y: 2.5pt),
  radius: 2pt,
  width: 100%,
  above: 4pt,
  below: 3pt,
  text(fill: white, weight: "bold", size: 6.8pt)[#title]
)

#let box-def(title, body) = block(
  fill: c-def-bg,
  stroke: (left: 1.8pt + c-def-bd),
  inset: (x: 3.5pt, y: 2.5pt),
  radius: (right: 2pt),
  width: 100%,
  above: 2.5pt,
  below: 2.5pt,
  [*#text(fill: c-def-bd)[#title]* #body]
)

#let box-hw(title, body) = block(
  fill: c-hw-bg,
  stroke: (left: 1.8pt + c-hw-bd),
  inset: (x: 3.5pt, y: 2.5pt),
  radius: (right: 2pt),
  width: 100%,
  above: 2.5pt,
  below: 2.5pt,
  [*#text(fill: c-hw-bd)[#title]* #body]
)

#let box-dia(title, body) = block(
  fill: c-dia-bg,
  stroke: 0.6pt + c-dia-bd,
  inset: (x: 3.5pt, y: 2.5pt),
  radius: 2pt,
  width: 100%,
  above: 2.5pt,
  below: 2.5pt,
  [*#text(fill: c-dia-bd)[#title]* \ #body]
)

#let box-tf(title, body) = block(
  fill: c-tf-bg,
  stroke: (left: 1.8pt + c-tf-bd),
  inset: (x: 3.5pt, y: 2.5pt),
  radius: (right: 2pt),
  width: 100%,
  above: 2.5pt,
  below: 2.5pt,
  [*#text(fill: c-tf-bd)[#title]* #body]
)

// ============================================================================
// PAGE 1: FOUNDATIONS, COMMITMENTS, PRFs, ZK, SIGMA PROTOCOLS, NIZKs, SNARGs
// ============================================================================

#block(
  fill: rgb("#0f172a"),
  inset: 4pt,
  radius: 2pt,
  width: 100%,
  below: 3pt,
  align(center)[
    #text(fill: white, weight: "bold", size: 7.5pt)[PRIVACY ENHANCING TECHNOLOGIES — MIDTERM CHEATSHEET] \
    #text(fill: rgb("#94a3b8"), size: 5.5pt)[
      *ROM*: Random Oracle Model | *PPT*: Prob. Poly-Time | *DLP/DDH*: Discrete Log / Decisional DH | *PRF/OPRF*: (Oblivious) Pseudorandom Func. | *HVZK*: Honest-Verifier ZK | *PoK*: Proof of Knowledge | *PCP/IOP*: Prob. Checkable / Interactive Oracle Proof | *PCS*: Poly. Commitment | *LHE/FHE*: (Linearly/Fully) Homomorphic Enc. | *PIR/DPF*: Private Info. Retrieval / Dist. Point Func.
    ]
  ]
)

#sec-hdr[1. Indistinguishability, FHE & Commitments (Lec 1–3, HW1)]

#box-def[Indistinguishability ($D_0, D_1$ parameterized by $lambda$):][
  - *Statistical ($D_0 equiv D_1$)*: Unbounded adversary with $"poly"(lambda)$ samples cannot distinguish; total variation distance is $"negl"(lambda)$.
  - *Computational ($D_0 approx^c D_1$)*: For any PPT adversary $cal(A)$, letting $W_b := {cal(A)(x) = 1 : x <- D_b}$, the advantage is:
    $"Adv"[cal(A)] := |Pr[W_0] - Pr[W_1]| <= "negl"(lambda)$.
]

#box-def[Homomorphic Encryption & Bootstrapping (Lec 1):][
  - *SHE over Integers (van Dijk et al.)*: Secret key = large odd prime $p$.
    - $"Enc"_p (b) = p q + 2 r + b$ ($q$ random large int, noise $r "ll" p$, bit $b in {0,1}$).
    - $"Dec"_p (c) = (c mod p) mod 2 = (2 r + b) mod 2 = b$ (if $|2 r + b| < p / 2$).
    - *Addition*: $c_1 + c_2 = p(q_1 + q_2) + 2(r_1 + r_2) + (b_1 + b_2)$ (noise *doubles*).
    - *Multiplication*: $c_1 c_2 = p(dots) + 2(2 r_1 r_2 + r_1 b_2 + r_2 b_1) + b_1 b_2$ (noise *squares*).
  - *Bootstrapping (Gentry)*: Turn SHE into FHE by sending $c' = "Enc"_"pk" (c)$ and homomorphically evaluating $"Dec"_p$ using $"Enc"_"pk" ("sk")$ to reset noise.
  - *Exam Trap*: $"Eval"(f, "Enc"(m)) != "Enc"(f(m))$! (Would violate IND-CPA since $"Enc"$ is randomized; we only guarantee $"Dec"("Eval"(f, c)) = f(m)$).
]

#box-def[Commitment Schemes ($"Commit": cal(M) times cal(R) -> cal(C)$):][
  - *(Statistical) Hiding*: Commitment $c$ leaks nothing about $m$:
    $forall m_0, m_1 in cal(M), quad {"Commit"(m_0, r) : r <-^ cal(R)} equiv {"Commit"(m_1, r) : r <-^ cal(R)}$.
  - *(Computational) Binding*: Cannot open $c$ to two distinct messages:
    $forall "PPT" cal(A), quad Pr[(m_0, r_0, m_1, r_1) <- cal(A)(1^lambda) : m_0 != m_1 and "Commit"(m_0, r_0) = "Commit"(m_1, r_1)] <= "negl"(lambda)$.
  - *Impossibility*: Cannot be *both* statistically hiding and statistically binding! (If stat. hiding, for any $c = "Commit"(m_0, r_0)$ and $m_1 != m_0$, an unbounded $cal(A)$ can brute-force an $r_1$ such that $"Commit"(m_1, r_1) = c$).
  - *ROM Construction*: $"Commit"(m, r) := H(m, r)$ where $|cal(R)|, |cal(C)| = 2^("poly"(lambda))$. Comp. hiding (needs $Q / |cal(R)|$ queries to guess $r$) & comp. binding (collision resistance of RO; unbounded $cal(A)$ breaks in $2^lambda$ queries). *Not* provably secure if $H$ is instantiated with plain SHA-3 without ROM!
]

#box-def[Pedersen Commitment (No ROM Needed! Lec 3):][
  - *Setup*: Group $GG$ of prime order $q$, generators $g, h in GG$ with $h = g^x$ ($x = log_g h$ unknown).
  - *Commit*: $"Commit"(m, r) := g^m h^r in GG$ for $m, r in ZZ_q$.
  - *Linear Homomorphism*: $"Commit"(m_0, r_0) dot "Commit"(m_1, r_1) = g^(m_0 + m_1) h^(r_0 + r_1) = "Commit"(m_0 + m_1, r_0 + r_1)$.
  - *Perfectly (Statistically) Hiding*: Since $c = g^m (g^x)^r = g^(m + x r)$, for any $c = g^alpha$ and any $m' in ZZ_q$, there is a unique $r' = (alpha - m') x^(-1) mod q$. As $r <-^ ZZ_q$, $c$ is uniform in $GG$.
  - *Computationally Binding under DLP*: Suppose $cal(A)$ outputs $(m_0, r_0), (m_1, r_1)$ with $m_0 != m_1$ and $g^(m_0) h^(r_0) = c = g^(m_1) h^(r_1)$ (note: implies $r_0 != r_1 mod q$). Then:
    $g^(m_0 - m_1) = h^(r_1 - r_0) = g^(x(r_1 - r_0)) => x = frac(m_0 - m_1, r_1 - r_0) mod q$.
    Thus $"AdvDLP"(cal(B), GG) = "AdvBind"(cal(A), GG)$. (Requires *DLP*, which is weaker than DDH!).
]

#box-hw[HW1.2: Security of Variant Commitment Schemes:][
  #table(
    columns: (1.5fr, 1.1fr, 1.1fr, 2.3fr),
    inset: 2pt,
    stroke: 0.4pt + gray,
    [*Scheme*], [*Hiding?*], [*Binding?*], [*Why / Attack*],
    [$H(r)^m in GG$], [Neither], [Neither], [$m=0 => c=1$ (not hiding). Unbounded $cal(A)$ picks $r_1, r_2$, solves $m_i = log_(H(r_i)) c$ (not stat. binding).],
    [$m plus.o r$], [Stat. Yes], [No], [OTP is perfectly hiding. Open to any $m'$ via $r' = c plus.o m'$.],
    [Pedersen ($h=g^x$, $x$ *known*)], [Perfect (Stat.)], [No], [$r = (alpha - m)/x$ still uniform. Open to any $m'$ via $r' = r + (m - m')/x mod q$.],
    [ElGamal: $(g^r, g^m h^r)$], [Comp. (if $x$ unknown); *No* if $x$ known], [*Stat. Binding ALWAYS*], [$g^r$ uniquely fixes $r$, which uniquely fixes $m$ in $g^m h^r$! If $x$ known, recover $g^m = c_2 dot (c_1)^(-x)$.]
  )
]

#box-def[Vector Commitments (VC) & Merkle Trees (Lec 3, HW1.4):][
  - *Syntax*: $"Commit"(m_1, dots, m_n) -> c$; $"Open"(c, i, m_i) -> pi_i$; $"Verify"(c, i, m_i, pi_i) in {0,1}$.
  - *Position Binding*: No PPT $cal(A)$ can find $(c, i, m != m', pi, pi')$ s.t. $"Verify"(c, i, m, pi) = "Verify"(c, i, m', pi') = 1$.
  - *Naïve VC (HW1.4a)*: $c = (H(m_1, r_1), dots, H(m_n, r_n))$, $|c| = n lambda$, $pi_i = r_i$, $|pi_i| = O(lambda)$.
  - *Merkle Tree VC (HW1.4b)*: Binary hash tree of depth $log_2 n$. Leaves $u_(i) = H(m_i, r_i)$; internal nodes $u = H(u_"left" || u_"right")$; commitment $c = u_"root"$ ($|c| = lambda$). Opening $pi_i$ = $r_i$ + the $log_2 n$ sibling hashes on path to root ($|pi_i| = O(lambda log n)$). Breaking position binding requires a hash collision in $H$.
]

#sec-hdr[2. PRFs, DDH & Tight ROM Reductions (Lec 4, HW1.3)]

#box-def[Pseudorandom Functions (PRF) & DDH Problem:][
  - *PRF ($F: cal(K) times cal(X) -> cal(Y)$)*: Deterministic, efficient. Secure if indistinguishable from $f <-^ "Funcs"[cal(X), cal(Y)]$:
    $"AdvPRF"(cal(A), F) = |Pr[cal(A)^(F(k, dot)) = 1 : k <-^ cal(K)] - Pr[cal(A)^(f(dot)) = 1 : f <-^ "Funcs"[cal(X), cal(Y)]]| <= "negl"(lambda)$.
  - *DDH in $GG$ (prime order $q$, gen $g$)*: Distinguish real vs random triples:
    $D_0 = {(g^alpha, g^beta, g^(alpha beta)) : alpha, beta <-^ ZZ_q} quad "vs" quad D_1 = {(g^alpha, g^beta, g^gamma) : alpha, beta, gamma <-^ ZZ_q}$.
  - *Hardness Hierarchy*: $"DDH Hard" => "CDH Hard" => "DLP Hard"$. (Contrapositive: $"DLP Easy" => "DDH Easy"$).
]

#box-dia[PRF Security Game & DDH-based PRF $F(k, x) = H(x)^k$ in ROM:][
  #grid(
    columns: (1fr, 1.3fr),
    gutter: 4pt,
    rect(inset: 2.5pt, stroke: 0.4pt + c-dia-bd)[
      *PRF Game ($b in {0,1}$)*: \
      If $b=0$: $k <-^ cal(K), f := F(k, dot)$ \
      If $b=1$: $f <-^ "Funcs"[cal(X), cal(Y)]$ \
      $cal(A)$ queries $x_i ->$ gets $y_i = f(x_i)$, outputs $b'$.
    ],
    rect(inset: 2.5pt, stroke: 0.4pt + c-dia-bd)[
      *ROM PRF*: $F(k, x) = H(x)^k$ ($k in ZZ_q$, $H: cal(X) -> GG$ RO). \
      *Lecture Loose Proof (1 PRF query)*: $cal(B)$ gets $(X, Y, Z) = (g^alpha, g^beta, g^gamma)$, guesses $i^* <-^ [Q_"RO"]$, programs $H(x_(i^*)) = X$ (others $g^(r_i)$), answers PRF query $x_(i^*)$ with $Z$. $"AdvDDH" >= "AdvPRF" / Q_"RO"$.
    ]
  )
]

#box-hw[HW1.3: Tight DDH-to-PRF Reduction (Random Self-Reducibility):][
  - *1.3b Re-randomizing a DDH Triple (1 Query)*: Given $(X, Y, Z) = (g^alpha, g^beta, g^gamma)$, sample $r <-^ ZZ_q$ and set:
    $X' = X dot g^r = g^(alpha + r), quad Z' = Z dot Y^r = g^(gamma + r beta)$.
    Since $r$ is uniform, $X'$ is uniform in $GG$. If $(X, Y, Z) in D_0$ ($gamma = alpha beta$), then $Z' = g^(alpha beta + r beta) = (X')^beta$ (real DDH triple). If $(X, Y, Z) in D_1$ ($gamma$ random), $Z' = g^(gamma + r beta)$ is uniform in $GG$ (fake triple).
  - *1.3c Tight Simulation (1 PRF Query)*: On $i$-th RO query $m_i$, $cal(B)$ samples $r_i <-^ ZZ_q$, *programs RO* $H(m_i) := X dot g^(r_i)$, stores $(m_i, r_i)$. On PRF query $m_j$, $cal(B)$ returns $Z dot Y^(r_j)$.
    - If $(X,Y,Z) in D_0$: $Z dot Y^(r_j) = g^(alpha beta + r_j beta) = (X g^(r_j))^beta = H(m_j)^beta = F(beta, m_j)$ (real PRF with key $k = beta$).
    - If $(X,Y,Z) in D_1$: $Z dot Y^(r_j) = g^(gamma + r_j beta)$ is uniform in $GG$. Thus $"AdvDDH"(cal(B), GG) = "AdvPRF"(cal(A), F)$ (no $1 / Q_"RO"$ loss!).
  - *1.3d Bonus (Multiple PRF Queries)*: Using $Z' = Z dot Y^(r_i)$ for $>1$ queries *fails* when $b=1$ ($Z = g^gamma$ fake) because $gamma$ is reused:
    $frac(log_g f(m_i) - log_g f(m_j), log_g H(m_i) - log_g H(m_j)) = frac((r_i - r_j) beta, r_i - r_j) = beta$ (not independent!).
    *Fix*: For each query $m_i$, sample *two* scalars $u_i, v_i <-^ ZZ_q$, set $H(m_i) = X^(u_i) g^(v_i) = g^(alpha u_i + v_i)$ and $f(m_i) = Z^(u_i) Y^(v_i)$. If $Z = g^(alpha beta)$, $f(m_i) = H(m_i)^beta$. If $Z = g^gamma$ ($gamma != alpha beta$), exponents $gamma u_i + beta v_i$ are pairwise independent and uniform!
]

#sec-hdr[3. Zero-Knowledge, PoK & Sigma Protocols (Lec 5–7, HW2)]

#box-def[Interactive Proofs, ZK & Proof of Knowledge (PoK):][
  - *Interactive Proof $(P, V)$ for $L$*:
    - *Completeness*: $forall x in L, Pr[chevron.l P, V chevron.r (x) = 1] >= 2/3$ (often $1$).
    - *Soundness*: $forall x not in L, forall P^*, Pr[chevron.l P^*, V chevron.r (x) = 1] <= 1/3$ (error $epsilon$). Sequential repetition $O(lambda)$ times gives error $epsilon^lambda = "negl"(lambda)$. (Note: If $V$ is deterministic, $L in "NP"$).
  - *Zero-Knowledge (ZK)*: $forall "PPT" V^*, exists "PPT" "Sim"$ such that $forall x in L$:
    $"View"[chevron.l P(x, w), V^*(x) chevron.r] approx^c "Sim"^(V^*)(x)$ (where $"Sim"^(V^*)$ has oracle/rewinding access to $V^*$).
  - *Proof of Knowledge (PoK) with knowledge error $epsilon$*: $exists "PPT" "Ext"$ (with rewinding access to $P^*$) s.t. $forall x, forall P^*$:
    $Pr[M(x, w) = 1 : w <- "Ext"^(P^*)(x)] >= Pr[chevron.l P^*, V chevron.r (x) = 1] - epsilon$.
]

#box-def[Graph Hamiltonicity ZK Protocol (Lec 5):][
  - *Protocol*: $P$ picks random vertex permutation $Pi$, commits to adjacency matrix of $Pi(G)$ and to $Pi$. $V$ sends $c <-^ {0,1}$. If $c=0$, $P$ opens all matrix cells and $Pi$ ($V$ checks $Pi(G)$ is isomorphic to $G$). If $c=1$, $P$ opens only the edges of the Hamiltonian cycle in $Pi(G)$ ($V$ checks they form an $n$-cycle).
  - *Security*: Needs *perfectly binding* (for soundness against unbounded $P^*$, error $1/2$) & *comp. hiding* commitment.
  - *Simulator $"Sim"^(V^*)(G)$*: Guesses $hat{c} <-^ {0,1}$. If $hat{c}=0$, commits to random $Pi(G)$; if $hat{c}=1$, commits to complete graph $K_n$. Sends commitments to $V^*$ to get $c$. If $c = hat{c}$ (prob $1/2$), opens as requested; else *rewinds* $V^*$ and repeats!
]

#box-dia[Sigma ($Sigma$) Protocols & Schnorr Identification (Lec 7, HW2.3):][
  #grid(
    columns: (1.15fr, 1.35fr),
    gutter: 4pt,
    rect(inset: 2.5pt, stroke: 0.4pt + c-dia-bd)[
      *3-Move Public-Coin $Sigma$-Protocol*: \
      1. $P(x, w) -> V$: Commitment $u$ \
      2. $V -> P$: Random challenge $c <-^ cal(C)$ \
      3. $P -> V$: Response $z$ \
      4. $V$: Det. $"verif"(x, u, c, z) in {0,1}$ \
      *3 Required Properties*: \
      - *Perfect Completeness*: $Pr = 1$. \
      - *Special Soundness*: Given $(u, c, z)$ and $(u, c', z')$ with $c != c'$, $"Ext"$ computes $w$ in poly-time ($=> "soundness error" <= 1/|cal(C)|$). \
      - *HVZK*: $"Sim"(x, c) -> (u, c, z)$ indistinguishable from honest $V$ view.
    ],
    rect(inset: 2.5pt, stroke: 0.4pt + c-dia-bd)[
      *Schnorr Protocol ($h = g^x in GG$, witness $x in ZZ_q$)*: \
      1. $P$: $r <-^ ZZ_q$, sends $u = g^r$. \
      2. $V$: Sends $c <-^ ZZ_q$. \
      3. $P$: Sends $z = r + c x mod q$. \
      4. $V$: Accepts iff $g^z = u dot h^c$. \
      *HVZK $"Sim"(h, c)$*: Pick $z <-^ ZZ_q$, set $u = g^z dot h^(-c)$, output $(u, c, z)$ (identical distribution!). \
      *PoK $"Ext"^(P^*)(h)$*: Run $P^* -> u$. Send $c <-^ ZZ_q -> z$. *Rewind* $P^*$ to after $u$, send $c' <-^ ZZ_q -> z'$. If $c != c'$ (prob $1 - 1/q$), $g^(z-z') = h^(c-c') => x = frac(z - z', c - c') mod q$.
    ]
  )
]

#box-hw[HW2.2 & HW2.4: Composition Rules & Circuit SAT (CSAT) ZK:][
  - *Sequential Composition ($lambda$ times)*: Soundness error $epsilon^lambda$. *Preserves general ZK* (simulate each independent execution one-by-one sequentially).
  - *Parallel Composition ($lambda$ times)*: Soundness error $epsilon^lambda$. *Preserves HVZK and PoK*, but *FAILS general ZK* against malicious $V^*$! ($V^*$ can choose $c_1, dots, c_lambda$ adaptively as a hash of all $u_1, dots, u_lambda$; $"Sim"$ would have to guess all $lambda$ challenges simultaneously with prob $2^(-lambda)$).
  - *HW2.4 CSAT ZK from $Sigma_"XOR"$ & $Sigma_"AND"$*: Given perfectly binding, comp. hiding bit commitment:
    1. $P$ commits to every wire $w$ in circuit ($c_w = "Commit"(b_w, r_w)$) and sends 1st move $a_j$ of $Sigma_"XOR" / Sigma_"AND"$ for every gate $j in [N]$.
    2. $V$ sends random challenges $e_j$ for all gates; $P$ replies with $z_j$ for all gates *and opens final output wire* $c_"out"$ to $1$.
    3. *Soundness*: By perfect binding, every wire commitment holds a fixed bit. If $C$ is unsatisfiable yet $c_"out"$ opens to $1$, at least one gate $j$ has inconsistent wire bits, breaking soundness of $Sigma_"XOR"$ or $Sigma_"AND"$.
    4. *HVZK Simulator*: Commits to $1$ on *every* wire in the circuit (so $c_"out"$ opens to $1$ validly!), and runs $"Sim"_"XOR"$ / $"Sim"_"AND"$ on each gate's commitments. Indistinguishable by comp. hiding + HVZK (via hybrid argument over gates then wires).
]

#sec-hdr[4. NIZKs & The Fiat-Shamir Transform (Lec 8, HW3)]

#box-dia[Fiat-Shamir Transform: $Sigma$-Protocol $->$ NIZK in ROM:][
  - *Idea*: Replace $V$'s random challenge with RO hash of statement & first message:
    $P_"NI" (x, w): u <- P_1(x, w), quad c <- H(x, u), quad z <- P_2(x, w, r_P, c), quad "output" pi = (u, z)$.
    $V_"NI" (x, pi): c <- H(x, u), quad "output" "verif"(x, u, c, z) in {0,1}$.
  - *NIZK Zero-Knowledge ($"Sim"'$)*: Given $x$, sample $c <-^ cal(C)$, run HVZK $"Sim"(x, c) -> (u, c, z)$, *program RO* so $H(x, u) := c$, output $pi = (u, z)$. (Achieves *full ZK* against malicious verifiers from mere *HVZK* because there is no interaction!).
  - *NIZK PoK ($"Ext"'$)*: Run $P^*$ until it queries RO on $(x, u)$; program $H(x, u) := c <-^ cal(C)$ to get $(u, c, z)$. *Rewind* $P^*$ to that RO query, reprogram $H(x, u) := c' <-^ cal(C)$ to get $(u, c', z')$, then extract $w$ via Special Soundness!
]

#box-hw[HW3.2 & HW3.3: Fiat-Shamir Soundness Traps & Transferability:][
  - *Schnorr NIZK Soundness (HW3.2c)*: For $x not in L$ (or forging without witness), for any $u = g^r$ queried to $H(h, u)$, at most *one* $c in ZZ_q$ satisfies $g^z = u h^c$. Since $H$ outputs uniform $c in ZZ_q$, each of $P^*$'s $Q$ RO queries succeeds with prob $1/q$. By union bound, soundness error $<= Q / q$ (or $(Q+1)/q$).
  - *Transferability (HW3.2d)*: *NIZK is transferable* ($V$ can forward static $pi$ to $V'$). *Interactive ZK is NOT transferable* (since $"Sim"$ can generate an identical transcript without a witness, $V'$ isn't convinced by $V$'s transcript).
  - *Why Base Soundness $1/2$ Fails in FS (HW3.3a)*: In NIZK, there is no interactive repetition, so soundness error *must be negligible*. If $Sigma$ has soundness error $1/2$, $P'$ generates $u$ using $P^*$, hashes $c = H(x, u)$, and gets a valid $z$ with probability $1/2$ on a single try!
  - *Parallel vs Sequential FS Repetition (HW3.3b)*:
    - *Parallel (CORRECT)*: $P'$ generates $(u_1, dots, u_lambda)$, queries $(c_1, dots, c_lambda) = H(x, u_1, dots, u_lambda)$, outputs $(z_1, dots, z_lambda)$. Each RO query succeeds with prob $(1/2)^lambda =>$ total soundness error $<= Q dot 2^(-lambda) = "negl"(lambda)$.
    - *Sequential / Independent Hashes (BROKEN)*: If $c_i = H(x, u_i)$, $P^*$ can grind each $u_i$ independently until $c_i$ works (2 tries per coordinate $=> 2 lambda$ RO queries total to forge!).
]

#colbreak()

// ============================================================================
// PAGE 2: SNARGs, POLY-IOPs, PCS, PLONK, PIR, DPFs, ORAM, MPC, OPRF/PSI, T/F
// ============================================================================

#sec-hdr[5. SNARGs, PCPs, Poly-IOPs, PCS & PLONK (Lec 9–12, HW3.4, HW4)]

#box-def[SNARG & SNARK Blueprint:][
  - *SNARG*: Succinct Non-Interactive Argument. Proof size $|pi| = "poly"(lambda, log(|x| + |w|))$, verification time $O(|x| dot "poly"(lambda, log |w|))$. *SNARK* = SNARG + Knowledge Soundness (PoK).
  - *Pipeline*: $"PCP" => "IOP" => "Poly-IOP" + "PCS (Cryptographic Box)" + "Fiat-Shamir" => "SNARG"$.
  - *PCP Theorem*: Any NP statement $x$ ($|x|=m$) has a proof $pi in {0,1}^("poly"(m))$ checkable by randomized $cal(V)_"PCP"$ reading $O(1)$ (e.g. 3) bits with completeness $1$ and soundness error $<= 1/2$.
]

#box-hw[HW3.4: SNARG from PCP + Merkle Vector Commitment (in ROM):][
  1. *Commit*: $P$ runs $cal(P)_"PCP" (x, w) -> pi in {0,1}^("poly"(m))$, sends Merkle root $c = "Commit"(pi)$.
  2. *Challenge*: $V$ runs $cal(V)_"PCP"$ $lambda$ times in parallel to pick $O(lambda)$ indices $I = (i_1, dots, i_ell)$ (in FS: $I = H(x, c)$).
  3. *Open*: For each $i_j in I$, $P$ sends $(pi_(i_j), sigma_j <- "Open"(c, i_j, pi_(i_j)))$. $V$ checks all Merkle openings and $cal(V)_"PCP" = 1$.
  - *Complexity*: Soundness $(1/2)^lambda$ (or $Q dot 2^(-lambda)$ in ROM); Proof size $O(lambda) dot O(lambda log m) = O(lambda^2 log m)$.
]

#box-dia[IOPs & Polynomial Magic (Schwartz-Zippel, Equality, ZeroTest):][
  - *Linear IOP*: Proof $pi in FF^n$; $V$ queries linear combinations $chevron.l q, pi chevron.r$. (Strong HVZK: $"Sim"_"IOP"()$ takes *no input* and outputs transcript identical to $V$'s view).
  - *Poly-IOP*: $P$ puts degree-$<= d$ polynomials $f in FF[X]_(<= d)$ in "oracle box"; $V$ queries $f(r)$ at $r <-^ FF$.
  - *Schwartz-Zippel Lemma*: Non-zero $f in FF[X]_(<= d)$ has $<= d$ roots ($Pr_(r <-^ S)[f(r) = 0] <= d / |S|$). *(Requires $FF$ to be a field! Fails over rings like $ZZ_6$ since $2 X^2 + 4 X = 2 X(X+2)$ has roots $0, 1, 3, 4 mod 6$)*.
  #grid(
    columns: (1fr, 1.35fr),
    gutter: 4pt,
    rect(inset: 2.5pt, stroke: 0.4pt + c-dia-bd)[
      *Equality Test ($f equiv g$, deg $<= d$)*: \
      $P$ commits $f, g$ to box. \
      $V$ picks $r <-^ FF$, queries $f(r), g(r)$, accepts iff $f(r) = g(r)$. \
      *Soundness error*: $<= d / |FF|$.
    ],
    rect(inset: 2.5pt, stroke: 0.4pt + c-dia-bd)[
      *ZeroTest ($f(a) = 0 quad forall a in Omega subset FF$)*: \
      Vanishing poly $Z_Omega (X) = product_(a in Omega) (X - a)$ (known to both $P, V$). \
      $P$ commits $f(X)$ and quotient $q(X) = f(X) / Z_Omega (X)$ to box. \
      $V$ picks $r <-^ FF$, checks $f(r) = q(r) dot Z_Omega (r)$. \
      *Soundness error*: $<= (d + |Omega|) / |FF| <= 2 d / |FF|$. \
      *(If $Omega = {1, omega, dots, omega^(d-1)}$ roots of unity, $Z_Omega (X) = X^d - 1$, evaluated by $V$ in $O(log d)$ via repeated squaring!)*
    ]
  )
]

#box-hw[HW4.2: Poly-IOPs for Coefficient & Inner Product Checks (DARK):][
  - *4.2a No coeffs of degree $< i$*: $P$ sends $f$ (deg $d$) and $g$ (deg $d - i$). $V$ checks $f(r) = r^i dot g(r)$ at $r <-^ FF$. Soundness error $<= d / |FF|$.
  - *4.2b $i$-th coeff of $f(X)$ is $beta$*: Write $f(X) = f_L (X) + beta X^i + X^(i+1) f_R (X)$ with $deg(f_L) <= i - 1$ and $deg(f_R) <= d - i - 1$. $P$ sends $f, f_L, f_R$ with degree bounds; $V$ checks $f(r) = f_L (r) + beta r^i + r^(i+1) f_R (r)$ at $r <-^ FF$. Soundness error $<= d / |FF|$.
  - *4.2c Inner Product $chevron.l bold(a), bold(b) chevron.r = z$ ($bold(a), bold(b) in FF^(d+1)$)*: Encode $f(X) = sum_(j=0)^d a_j X^j$ and reversed $g(X) = sum_(j=0)^d b_(d-j) X^j$. In $h(X) = f(X) g(X)$ (deg $2 d$), the $d$-th coeff of $h(X)$ is $sum_(j=0)^d a_j b_j = chevron.l bold(a), bold(b) chevron.r$! $P$ sends $f, g, h$; $V$ checks $h(r) = f(r) g(r)$ (error $2 d / |FF|$) + runs 4.2b to check $d$-th coeff of $h$ is $z$ (error $2 d / |FF|$). Total soundness error $<= 4 d / |FF|$.
]

#box-def[Polynomial Commitment Scheme (PCS) & KZG (Lec 11, HW4.3):][
  - *Syntax*: $"Setup"(1^lambda, d) -> "pp"$; $"Commit"("pp", f) -> c$; $"Open"("pp", f, z) -> pi$; $"Verify"("pp", c, z, y, pi) in {0,1}$.
  - *Evaluation Binding*: No PPT $cal(A)$ can output $(c, z, y, pi, y', pi')$ with $y != y'$ such that both verify to $1$.
  - *KZG Construction (HW4.3, over group $GG$ of prime order $p$ with pairing $"VerifProd"$)*:
    - *Trusted Setup*: Sample secret $alpha <-^ ZZ_p^*$, output $"pp" = (g, g^alpha, g^(alpha^2), dots, g^(alpha^d))$ (then delete $alpha$!).
    - *Commit*: For $f(X) = sum_(j=0)^d f_j X^j$, $P$ computes $c = g^(f(alpha)) = product_(j=0)^d (g^(alpha^j))^(f_j)$ *without knowing $alpha$*! (*Computationally binding* under $d$-SDH/DLP; *not* stat. binding as $p^(d+1) > p$).
    - *Open at $f(z) = y$*: Since $f(z) = y <=> (X - z) | (f(X) - y)$, $P$ computes quotient $q(X) = frac(f(X) - y, X - z)$ and sends opening proof $pi = "Commit"("pp", q) = g^(q(alpha))$.
    - *Verify $(c, z, y, pi)$*: Check $f(alpha) - y = q(alpha)(alpha - z)$ in the exponent via $"VerifProd"(pi, g^alpha dot g^(-z), c dot g^(-y)) = 1$.
]

#box-def[PLONK Poly-IOP & SNARG (Lec 12):][
  - *Goal*: Prove arithmetic circuit $C(x, w) = 0$ ($|C|$ gates of $+, times$; $|I| = |I_x| + |I_w|$ inputs).
  - *Trace Polynomial $f_"trace" in FF[X]_(<= d)$*: Degree $d = 3|C| + |I|$ over roots of unity $Omega = {omega^j}$.
    - *Inputs*: $f_"trace" (omega^(-j)) = "input"_j$ for $j = 1, dots, |I|$.
    - *Gates ($k = 0, dots, |C|-1$)*: Left in $= f_"trace" (omega^(3k))$, Right in $= f_"trace" (omega^(3k+1))$, Out $= f_"trace" (omega^(3k+2))$.
  - *Preprocessing ($O(|C|)$ time, circuit-specific)*: Commit to selector $f_"sel"$ ($f_"sel" (omega^(3k)) = 1$ for $+$, $0$ for $times$) and wiring permutation $f_"rot" : Omega -> Omega$.
  - *The 4 Verifier Checks*:
    1. *Output Check*: Final gate output is $0$: $f_"trace" (omega^(3|C|-1)) = 0$.
    2. *Public Input Check*: $V$ interpolates $f_"in" (X)$ (deg $<= |I_x|$) s.t. $f_"in" (omega^(-j)) = x_j$, runs ZeroTest on $f_"trace" (X) - f_"in" (X) = 0$ over $Omega_I = {omega^(-1), dots, omega^(-|I_x|)}$.
    3. *Gate Evaluation Check*: ZeroTest over $Omega_"gates" = {omega^(3k)}_(k=0)^(|C|-1)$ on:
       $f_"sel" (X)(f_"trace" (X) + f_"trace" (omega X)) + (1 - f_"sel" (X))(f_"trace" (X) dot f_"trace" (omega X)) - f_"trace" (omega^2 X) = 0$.
    4. *Wiring Check (Copy Constraints)*: Check $f_"trace" (x) = f_"trace" (f_"rot" (x)) quad forall x in Omega$.
  - *Note*: PLONK Poly-IOP is *information-theoretically sound* (holds even if $P = "NP"$!); compiling with KZG PCS + Fiat-Shamir makes it a *computationally sound* SNARG.
]

#sec-hdr[6. Private Information Retrieval (PIR) & DPFs (Lec 13–14, HW4.4, HW5)]

#box-dia[2-Server IT-PIR vs Single-Server LHE/FHE/Recursive PIR:][
  - *Goal*: Fetch $x_i$ from DB $x in {0,1}^n$ with comm $o(n)$ and privacy $"Query"(i) approx "Query"(j)$. *(1-server IT-PIR is impossible: requires $Omega(n)$ bits!)*.
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 3pt,
    rect(inset: 2pt, stroke: 0.4pt + c-dia-bd)[
      *2-Server IT-PIR* \
      *(Non-colluding)* \
      - *Linear $O(n)$*: Sample $q_0 <-^ {0,1}^n$, $q_1 = q_0 plus.o e_i$. Server $b$ sends $a_b = chevron.l q_b, x chevron.r in {0,1}$. Output $a_0 plus.o a_1 = x_i$. \
      - *Matrix $O(sqrt(n))$*: DB $X in {0,1}^(sqrt(n) times sqrt(n))$, $i=(r,c)$. Share $q_0 plus.o q_1 = e_c in {0,1}^(sqrt(n))$. Server $b$ sends col $a_b = X q_b in {0,1}^(sqrt(n))$. Output $(a_0 plus.o a_1)_r = X_(r,c)$.
    ],
    rect(inset: 2pt, stroke: 0.4pt + c-dia-bd)[
      *1-Server LHE PIR* \
      *(Comp. Security)* \
      Requires LHE: $"Enc"(m_1) plus.square "Enc"(m_2) = "Enc"(m_1 + m_2)$. \
      DB $X in {0,1}^(sqrt(n) times sqrt(n))$, $i=(r,c)$. \
      Client sends $q = "Enc"(k, e_c)$ ($sqrt(n)$ ciphertexts). \
      Server computes $a = X dot q = "Enc"(k, X e_c)$ ($sqrt(n)$ ciphertexts via homomorphic $+$). \
      Client decrypts $"Dec"(k, a_r) = X_(r,c)$. Comm: $O(lambda sqrt(n))$.
    ],
    rect(inset: 2pt, stroke: 0.4pt + c-dia-bd)[
      *Recursive & FHE PIR* \
      - *Recursive ($d$-dim)*: Reshape $X$ into $n^(1/d) times dots times n^(1/d)$. Send $q_1, dots, q_d$ ($d n^(1/d)$ cts). Server recursively indexes $a_0 -> a_1 -> dots$. *(Needs low ciphertext expansion $F$, else blows up as $F^d$; fails in 2-server IT-PIR!)*. \
      - *FHE PIR (HW4.4)*: Send $"Enc"(i_1), dots, "Enc"(i_(log n))$. Server evaluates $sum_(j=1)^n X_j dot C_"EQ" (i, j)$. Upload $O(lambda log n)$, Download $O(lambda)$.
    ]
  )
]

#box-hw[HW5.2 & HW5.3: PIR Upload/Download Balancing & DPFs:][
  - *HW5.2 Balancing Transform*: Given PIR with upload $U(n)$ and download $1$ bit: Split DB into $ell$ buckets of size $n / ell$. For $i = ("bucket" b in [ell], "offset" j in [n / ell])$, client generates *one* query $q <- "Query"(j)$ of size $U(n / ell)$. Server runs $"Answer"$ on all $ell$ buckets using $q$, returning $ell$ bits. Client takes $b$-th bit. *New Upload*: $U(n / ell)$, *New Download*: $ell$ bits.
  - *Distributed Point Functions (DPF, Lec 14 & HW5.3)*:
    - $"Gen"(x, y) -> (k_0, k_1)$ with $|k_b| = O(lambda log |cal(X)|)$ (built via GGM PRG binary tree).
    - *Correctness*: $"Eval"(k_0, x') + "Eval"(k_1, x') = y$ if $x' = x$, else $0$.
    - *Secrecy*: Individual key $k_beta approx^c "Sim"_beta (|x|, |y|)$ leaks nothing about $x, y$.
    - *2-Server DPF PIR*: $(k_0, k_1) <- "Gen"(i, 1)$. Server $b$ sends $a_b = sum_(j=1)^n x_j dot "Eval"(k_b, j) mod 2$. Client outputs $a_0 plus.o a_1 = x_i$. Total comm: $O(lambda log n)$!
    - *Keyword PIR*: For key-value pairs $(w_j, v_j)$ with $w_j in {0,1}^m$, client runs $"Gen"(w^*, 1)$ on domain $\{0,1\}^m$; server $b$ returns $sum_j v_j dot "Eval"(k_b, w_j)$.
]

#sec-hdr[7. Oblivious RAM (ORAM) (Lec 15–16)]

#box-def[ORAM Model, $sqrt{n}$ ORAM & Tree-Based ORAM:][
  - *Security*: Hides *which* address is accessed, *repeats/patterns*, and *Read vs Write* (all encrypted under IND-CPA); leaks *only* total number of accesses. *(Unlike PIR, ORAM client is stateful, supports writes, and encrypts DB)*.
  - *Batcher's Oblivious Sort*: Fixed data-independent sorting network in $O(n log^2 n)$ ops.
  - *Square-Root ($sqrt{n}$) ORAM (Lec 15)*:
    - *Layout*: Server holds $n$ real words + $sqrt{n}$ dummies permuted by random $pi$; Client holds local *stash* of size $sqrt{n}$.
    - *Access (`addr`)*: Client checks stash. If `addr` *is in stash*, read next unread dummy $pi(n + t)$ on server; if *not in stash*, read $pi("addr")$ on server. Append (updated) word to stash.
    - *Epoch Reshuffle*: Every $sqrt{n}$ accesses, obliviously sort & reshuffle stash + RAM under fresh $pi'$ in $O(n log^2 n)$. *Amortized cost*: $frac(O(n log^2 n), sqrt(n)) = O(sqrt(n) log^2 n) = tilde(O)(sqrt(n))$.
  - *Modern Tree-Based ORAM (Lec 16)*:
    - *Layout*: Binary tree of depth $L = log_2 n$; each node (bucket) holds $Z = O(log^2 n)$ encrypted blocks. Client stores $"PosMap"[b] in [n]$ of size $n/2$ (recursively stored in smaller ORAMs to get $O(1)$ client memory!).
    - *Invariant*: Block $b = floor("addr"/2)$ is always on the path from root to leaf $"PosMap"[b]$.
    - *`ReadAndUpdate(addr)`*: (1) Look up $"pos" = "PosMap"[b]$, assign fresh random leaf $"pos"' <-^ [n]$, set $"PosMap"[b] := "pos"'$. (2) Read entire path from root to $"pos"$, update block $b$, write blocks back (putting $b$ in root with tag $"pos"'$). (3) *Flush/Evict*: Pick random leaf $l <-^ [n]$, read path $l$, greedily push blocks down path $l$ as far as possible (to lowest common ancestor of $l$ and block's target leaf). *Cost*: $O(log^3 n)$ per access.
]

#sec-hdr[8. Secure MPC, Secret Sharing, OPRF & PSI (Lec 17–19, HW5/6)]

#box-def[MPC Security, Secret Sharing & Beaver Triples:][
  - *Semi-Honest Security*: Corrupt parties $C subset.eq [n]$ follow protocol, try to learn from transcript. Secure if $exists "PPT" "Sim"$ s.t. $forall x_1, dots, x_n$:
    $"Sim"(C, {x_i : i in C}, f(x_1, dots, x_n)) approx^c "View"_Pi (C, x_1, dots, x_n)$.
  - *Additive Secret Sharing ($t < n$)*: $[x] = (x_1, dots, x_n)$ with $x_i <-^ ZZ_q$ and $sum x_i = x mod q$.
  - *Shamir $(t, n)$-Threshold Sharing*: Pick random deg-$(t-1)$ poly $p(X) = s + a_1 X + dots + a_(t-1) X^(t-1) in FF_p [X]$; share $i$ is $(i, p(i))$. Any $t$ shares reconstruct $s = p(0)$ via Lagrange interpolation; $<= t-1$ shares leak nothing.
  - *GMW / Circuit MPC with Beaver Triples $([a], [b], [c])$ where $c = a b mod q$*:
    - *Linear Gates ($[x] + [y]$, $k dot [x]$)*: Computed *locally* with 0 communication!
    - *Multiplication Gate ($[x y]$)*: (1) Offline: Generate shared random triple $([a], [b], [c])$ via FHE + distributed decryption. (2) Online: Parties locally compute and publicly open $delta = x - a$ and $epsilon = y - b$ (one-time padded by $a, b$!), then locally compute:
      $[x y] = [c] + delta [b] + epsilon [a] + delta epsilon mod q$. *(Online phase is IT-secure against $n-1$ corruptions!)*.
]

#box-hw[HW5/6: DH-OPRF & Private Set Intersection (PSI):][
  - *DH-OPRF for $F(k, x) = H(x)^k$ in $GG$ (prime order $p$)*:
    1. Client (input $x$): Samples $r <-^ ZZ_p backslash {0}$, sends blinded $U = H(x)^r$ to Server.
    2. Server (key $k$): Sends $V = U^k = H(x)^(r k)$ to Client. Client unblinds: $V^(r^(-1) mod p) = H(x)^k$.
    - *Client Privacy (IT)*: Since $r != 0$ is uniform, $U = H(x)^r$ is uniform in $GG$. $"Sim"_"Server" (k)$ just samples $U <-^ GG$.
    - *Server Privacy (ROM + DDH)*: $"Sim"_"Client" (x, y = F(k, x))$ responds to $U = H(x)^r$ with $V = y^r$ (using known $r$ from RO query $H(x)$).
  - *PSI from OPRF (Alice set $A$, Bob set $B$, $|A|=|B|=N$)*:
    1. Bob samples $k$, sends $Y_B = {F(k, b) : b in B}$ to Alice.
    2. Alice runs OPRF with Bob on each $a in A$ to learn $y_a = F(k, a)$, outputs $A inter B = {a in A : y_a in Y_B}$ and sends $A inter B$ to Bob.
    - *$"Sim"_B (B, A inter B)$*: Samples $k <-^ cal(K)$, computes $Y_B$, runs $"Sim"_"Server"^"OPRF"$ $N$ times to get transcript $T$, outputs $(k, Y_B, T, A inter B)$.
]

#sec-hdr[9. True / False Exam Panic Bank (All Homeworks & Lectures)]

#box-tf[16 High-Yield Conceptual True/False Statements:][
  1. *If $P = "NP"$, secure PRFs / OWFs / IND-CPA encryption / FHE exist.* $->$ *FALSE* (All computational hardness assumptions collapse if $P = "NP"$).
  2. *If $P = "NP"$, ZK proofs (and NIZKs) exist for all NP languages.* $->$ *TRUE* ($V$ can decide $x in L$ in poly-time by itself, so the *empty protocol* is a valid statistical ZK & NIZK proof!).
  3. *If $P = "NP"$, all NP languages have a SNARG.* $->$ *FALSE* (Empty proof is succinct in size, but SNARG requires verification time sublinear in witness computation, which $P = "NP"$ does not guarantee).
  4. *If $P = "NP"$, the PLONK Poly-IOP is still sound.* $->$ *TRUE* (PLONK Poly-IOP is purely *information-theoretically* sound via Schwartz-Zippel; only the PCS step is computational).
  5. *In FHE, if $c = "Enc"(m)$, then $"Eval"(f, c) = "Enc"(f(m))$.* $->$ *FALSE* (Only $"Dec"("Eval"(f, c)) = f(m)$ holds; $"Enc"$ is randomized for IND-CPA).
  6. *$"Commit"(m, r) = H(m, r)$ is provably secure when $H$ is SHA-3.* $->$ *FALSE* (Only provably secure when $H$ is modeled as a Random Oracle).
  7. *In an interactive ZK proof with perfect completeness, $V^*$ interacting with honest $P$ on $x in L$ always accepts.* $->$ *FALSE* (Completeness only binds honest $V$; malicious $V^*$ can always output 0).
  8. *In an interactive ZK proof, honest $V$ interacting with malicious $P^*$ is zero-knowledge.* $->$ *FALSE* (ZK protects honest $P$; malicious $P^*$ can just send its witness $w$ in the clear to $V$).
  9. *If an interactive proof has soundness error $> 1/3$, it cannot be a PoK with knowledge error $< 1/3$.* $->$ *TRUE* (Otherwise $"Ext"$ could extract a valid witness $w$ for a false statement $x not in L$ with prob $> 1/3 - 1/3 = 0$, impossible!).
  10. *In the Standard Model (no RO), NIZKs exist for all languages in $P$.* $->$ *TRUE* (Empty proof is a NIZK for $L in P$).
  11. *In the Standard Model (no RO, no CRS), we can build NIZKs for all NP languages.* $->$ *(Likely) FALSE* (Standard-model NIZK without setup implies $L in "BPP"$, which would collapse $"NP" subset.eq "BPP"$).
  12. *Fiat-Shamir applied to a $Sigma$-protocol yields a NIZK with statistical ZK.* $->$ *FALSE* ($P^*$ with unbounded RO queries can distinguish; FS NIZK only gives computational ZK in ROM).
  13. *Over $ZZ_6$, $f(X) = 2 X^2 + 4 X$ has at most 2 roots.* $->$ *FALSE* ($6$ is not prime so $ZZ_6$ is not a field; $0, 1, 3, 4$ are all roots!).
  14. *A secure ORAM protocol directly implies a secure 1-server PIR protocol.* $->$ *FALSE* (ORAM requires client state, private key encryption of DB, and mutates server layout on reads).
  15. *Single-server information-theoretic PIR with $o(n)$ communication exists.* $->$ *FALSE* (Requires downloading $Omega(n)$ bits; otherwise server learns which bits could not affect the answer).
  16. *Parallel composition of $Sigma$-protocols preserves HVZK and Special Soundness, and is safe for Fiat-Shamir.* $->$ *TRUE* (Whereas sequential FS without chaining hashes is insecure!).
]
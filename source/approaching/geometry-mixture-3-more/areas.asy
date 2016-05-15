import geometry;

size(5cm);

point
    pM = (0,0), pD = (1,0), pB = (1/3, 1/4),
    pK = pM + pD - pB, pA = 2/3 * pM + 1/3 * pK,
    pC = intersectionpoint(parallel(pB, line(pA, pD)), parallel(pA, line(pM, pB))),
    pL = extension(pM, pD, pA, pC), pR = extension(pM, pD, pK, pC);

fill(pM--pL--pA--cycle ^^ pK--pR--pD--cycle, gray(0.85));

fill(pL--pC--pR--cycle, gray(0.70));

draw(pA--pB--pC--pD--cycle ^^ pM--pB--pD--pK--cycle, linewidth(1));

draw(pM--pD ^^ pC--pA ^^ pC--pK);

dot(Label("$A$", pA, SSW));
dot(Label("$B$", pB, NNW));
dot(Label("$C$", pC, NNE));
dot(Label("$D$", pD, E));
dot(Label("$M$", pM, W));
dot(Label("$K$", pK, S));


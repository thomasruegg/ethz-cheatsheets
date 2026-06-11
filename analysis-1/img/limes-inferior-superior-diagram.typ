#let limes-inf-sup-diagram(mybluecontrary, mypurple, limn) = {
  box(width: 100%, height: 20pt)[
    #let an(n) = calc.pow(-1, n) + 1 / n
    #let x-min = -1.3
    #let x-max = 1.6
    #let get-dx(x) = {
      (((x - x-min) / (x-max - x-min)) * 100%) - 50%
    }
    // Main number line
    #place(horizon + center, line(length: 100%, stroke: 0.5pt + luma(150)))

    // lim inf (green line and label) at -1
    #place(horizon + center, dx: get-dx(-1.0), line(angle: 90deg, length: 14pt, stroke: 1.2pt + mybluecontrary))
    #place(horizon + center, dx: get-dx(-1.0), dy: -14pt, text(size: 6.5pt, fill: mybluecontrary)[$limn inf(a_n)$])
    #place(horizon + left, dx: get-dx(-1.0) + 50% + 1.2%, dy: 5pt, text(size: 7pt, fill: mybluecontrary)[$<-------$])

    // lim sup (green line and label) at 1
    #place(horizon + center, dx: get-dx(1.0), line(angle: 90deg, length: 14pt, stroke: 1.2pt + mybluecontrary))
    #place(horizon + center, dx: get-dx(1.0), dy: -14pt, text(size: 6.5pt, fill: mybluecontrary)[$limn sup(a_n)$])
    #place(horizon + left, dx: get-dx(1.0) + 50% + 1.2%, dy: 5pt, text(size: 7pt, fill: mybluecontrary)[$<-------$])
    // Labels for -1, 0, 1
    #place(horizon + center, dx: get-dx(-1.0), dy: 10pt, text(size: 7pt)[-1])
    #place(horizon + center, dx: get-dx(0.0), dy: 10pt, text(size: 7pt)[0])
    #place(horizon + center, dx: get-dx(1.0), dy: 10pt, text(size: 7pt)[1])
    // Ticks on top
    #place(horizon + center, dx: get-dx(-1.0), line(angle: 90deg, length: 8pt, stroke: 0.5pt))
    #place(horizon + center, dx: get-dx(0.0), line(angle: 90deg, length: 8pt, stroke: 0.5pt))
    #place(horizon + center, dx: get-dx(1.0), line(angle: 90deg, length: 8pt, stroke: 0.5pt))

    // Sequence points
    // a_1 = 0
    #place(horizon + center, dx: get-dx(an(1)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(1)), dy: -8pt, text(size: 7pt, fill: mypurple)[$a_1$])

    // a_2 = 1.5
    #place(horizon + center, dx: get-dx(an(2)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(2)), dy: -8pt, text(size: 7pt, fill: mypurple)[$a_2$])

    // a_3 = -2/3
    #place(horizon + center, dx: get-dx(an(3)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(3)), dy: -8pt, text(size: 7pt, fill: mypurple)[$a_3$])

    // a_4 = 1.25
    #place(horizon + center, dx: get-dx(an(4)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(4)), dy: -8pt, text(size: 7pt, fill: mypurple)[$a_4$])

    // a_5 = -0.8
    #place(horizon + center, dx: get-dx(an(5)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(5)), dy: -8pt, text(size: 7pt, fill: mypurple)[$a_5$])

    // a_6 = 0.7
    #place(horizon + center, dx: get-dx(an(6)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(6)), dy: -8pt, text(size: 7pt, fill: mypurple)[$a_6$])

    #place(horizon + center, dx: get-dx(an(7)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(8)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(9)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(10)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(11)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(12)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(13)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(14)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(14)), dy: -8pt, text(size: 7pt, fill: mypurple)[$a_(14)$])
    #place(horizon + center, dx: get-dx(an(15)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(15)), dy: -8pt, text(size: 7pt, fill: mypurple)[$a_(15)$])
    #place(horizon + center, dx: get-dx(an(16)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(17)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(18)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(19)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(20)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(21)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(22)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(23)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(24)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(25)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(26)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(27)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(28)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(29)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(30)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(31)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(32)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(33)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(34)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(35)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(36)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(37)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(38)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(39)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(40)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(41)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(42)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(43)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(44)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(45)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(46)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(47)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(48)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(49)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(50)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(51)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(52)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(53)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(54)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(55)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(56)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(57)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(58)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(59)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(60)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(61)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(62)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(63)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(64)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(65)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(66)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(67)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(68)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(69)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(70)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(71)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(72)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(73)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(74)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(75)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(76)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(77)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(78)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(79)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(80)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(81)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(82)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(83)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(84)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(85)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(86)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(87)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(88)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(89)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(90)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(91)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(92)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(93)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(94)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(95)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(96)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(97)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(98)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(99)), circle(radius: 1.5pt, fill: mypurple))
    #place(horizon + center, dx: get-dx(an(100)), circle(radius: 1.5pt, fill: mypurple))
  ]
}

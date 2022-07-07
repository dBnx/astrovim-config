return {
  -- =================    TEXTUAL   ===========================
  parse("para", "\\paragraph{}"),
  -- ================= MATHEMATICAL ===========================
  parse(
    "ali",
    [===[
\begin{align}
\end{align}
]===]
  ),
  parse(
    "splitali",
    [===[
\end{align}
\begin{align}
]===]
  ),
  -- =================     META     ===========================
  parse("texroot", "% !TeX root="),
},
  {}

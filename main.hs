import Text.Printf

-- Aluna: Izabella M. Paulette

-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

-- Gera texto na carta
svgText :: Int -> Int -> Int -> String -> String -> String
svgText x y font cor text =
  printf "<text x='%d' y='%d' font-size='%d' fill='%s'> %s </text>" x y font cor text

-- Gera Reatangulo
svgRet :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> String -> String -> String
svgRet x1R y1R x2R y2R x3R y3R x4R y4R bordR corBordR corR =
  printf "<polygon points='%d,%d %d,%d %d,%d %d,%d' stroke-width = '%d' stroke = '%s' fill = '%s'/>\n" x1R y1R x2R y2R x3R y3R x4R y4R bordR corBordR corR

-- Gera Triangulo
svgPolig :: Int -> Int -> Int -> Int -> Int -> Int -> Int -> String -> String -> String
svgPolig x1T y1T x2T y2T x3T y3T bordT corBordT corT =
  printf "<polygon points='%d,%d %d,%d %d,%d' stroke-width = '%d' stroke = '%s' fill = '%s' />\n" x1T y1T x2T y2T x3T y3T bordT corBordT corT

-- Gera SVG com 2 círculos, um verde e um vermelho, com 0.4 de opacidade.
-- A opacidade pode não ser suportada em alguns visualizadores de SVG.
svgAll :: String
svgAll = 
  svgBegin 500 500 ++
  (svgPolig 250 300 500 450 0 450 5 "rgb(0,0,0)" "rgb(255,228,225)") ++ --Triangulo central baixo
  (svgPolig 0 150 250 300 0 450 5 "rgb(0,0,0)" "rgb(255,228,225)") ++ --Triangulo esquerdo
  (svgPolig 500 150 500 450 250 300 5 "rgb(0,0,0)" "rgb(255,228,225)") ++ --Triangulo direito
  (svgPolig 250 0 500 150 0 150 5 "rgb(0,0,0)" "rgb(255,228,225)") ++  --Triangulo central alto
  (svgPolig 250 300 500 150 0 150 0 "rgb(0,0,0)" "rgb(255,228,225)") ++ --Triangulo central
  -- Folha
  (svgPolig 250 300 450 180 50 180 0 "rgb(0,0,0)" "rgb(255,255,255)") ++
  (svgRet 450 100 450 180 50 180 50 100 0 "rgb(0,0,0)" "rgb(255,255,255)") ++
  (svgText 100 150 25 "rgb(0,0,0)" 
  --Defina um texto ->
  "Hello Word!"
  ) ++
  svgEnd

main :: IO ()
main = do
  writeFile "carta.svg" svgAll

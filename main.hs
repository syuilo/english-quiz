import System.Random

-- いくつ選択肢を表示するか
choicesCount = 3

-- 辞書
wordsx :: [(String, String)]
wordsx = [("eat", "食べる"), ("make", "作る"), ("take", "取る"), ("rain", "雨"), ("float", "浮かぶ"), ("line", "線"), ("bird", "鳥"), ("concern", "関係する")]

main = do
  question
  putStrLn "\n----------"
  main -- ループさせる

question = do
  -- 選択肢取得
  choices <- sequence (replicate choicesCount getRandomWord)

  -- 正解を決定
  a <- getStdRandom (randomR (0, choicesCount - 1)) :: IO Int

  -- 問題を表示
  putStrLn $ fst (choices !! a)
  putStrLn $ unlines (map (\i -> show (i + 1) ++ ". " ++ snd (choices !! i)) [0 .. (choicesCount - 1)])

  -- ユーザーの答え
  key <- getLine

  let choice = (read key) - 1

  -- 合っているか
  putStrLn $ if choice == a then "Nice job!" else "Wrong answer!"

-- ランダムな単語を取得
getRandomWord :: IO (String, String)
getRandomWord = do
  r <- getStdRandom (randomR (0, (length wordsx) - 1)) :: IO Int
  return (wordsx !! r)

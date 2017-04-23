import System.Random

-- いくつ(ダミーの)選択肢を表示するか
choicesCount = 2

-- 辞書
wordsx :: [(String, String)]
wordsx = [("eat", "食べる"), ("make", "作る"), ("take", "取る"), ("rain", "雨"), ("float", "浮かぶ"), ("line", "線"), ("bird", "鳥"), ("concern", "関係する")]

main = do
  question
  putStrLn $ "\n----------"
  main -- ループさせる

question = do
  -- お題取得
  wordx <- getRandomWord

  -- 選択肢取得
  dummyChoices <- sequence (replicate choicesCount getRandomWord)
  let choices = [wordx] ++ dummyChoices

  -- 問題を表示
  putStrLn $ fst wordx
  putStrLn $ unlines (map (\i -> show (i + 1) ++ ". " ++ snd (choices !! i)) [0 .. choicesCount])

  -- ユーザーの答え
  key <- getLine

  let choice = (read key) - 1

  -- 合っているか
  putStrLn $ if (choices !! choice) == wordx then "Nice job!" else "Wrong answer!"

-- ランダムな単語を取得
getRandomWord :: IO (String, String)
getRandomWord = do
  r <- getStdRandom (randomR (0, (length wordsx) - 1)) :: IO Int
  return (wordsx !! r)

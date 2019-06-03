import Html exposing (text)
import Debug exposing (toString)

stringToNumber numericString =
  let
    thisIsMaybeType = String.toFloat numericString
  in
    case thisIsMaybeType of
      Nothing ->
        0
      Just num ->
        num

-- 输入数字字符串返回数字
main = "3.14" |> stringToNumber |> toString |> text

-- 输入文字字符串返回0
-- main = "haha" |> stringToNumber |> toString |> text

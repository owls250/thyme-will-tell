import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

-- example based on https://guide.elm-lang.org/architecture/text_fields.html


-- MAIN

main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL

type alias Model = 
    { recipe : String
    --TODO: ingredients should be either record or tuple with strings and ints
    -- I am just getting it to compile by setting it to float 
    , ingredients : Float
    , instructions : String
    }


init : Model
init = 
    { recipe = "" 
    , ingredients = 0
    , instructions = "" }



-- UPDATE

type Msg
    = Change String
    | Portion Float


update : Msg -> Model -> Model
update msg model = 
    case msg of 
        Change newRecipe ->
            { model | recipe = newRecipe }
        Portion size -> 
        --As above this is just to get it to compile
            { model | ingredients = size }
            --{ model | ingredients = times( size) }


--times : Int -> Model
--times msg model = 
    



-- View


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Welcome to our recipe assistant!"]
        , p []
            [ text "hi!" ]
        , input [ placeholder "Ingredients", value (String.fromFloat model.ingredients), onInput Change][]
        , input [ placeholder "Instructions", value model.instructions, onInput Change][]
        , button [ onClick (Portion (1/3)) ] [ text "1/3x" ]
        , button [ onClick (Portion (1/2)) ] [ text "1/2x" ]
        , button [ onClick (Portion 2) ] [ text "2x" ]
        , button [ onClick (Portion 3) ] [ text "3x" ]
        , button [ onClick (Portion 4) ] [ text "4x" ]
        , div [] [ text (model.recipe)] -- do something here
        ] 
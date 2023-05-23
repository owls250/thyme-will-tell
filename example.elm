import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Html exposing (..)
import Html.Attributes exposing (..)

-- example based on https://guide.elm-lang.org/architecture/text_fields.html


-- MAIN

main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL

type alias Model = 
    { recipe : String
    , ingredients : Array
    , instructions : String
    }


init : Model
init = 
    { recipe = "" 
    , ingredients = []
    , instructions = "" }



-- UPDATE

type Msg
    = Change String


update : Msg -> Model -> Model
update msg model = 
    case msg of 
        Change newRecipe ->
            { model | recipe = newRecipe }
        Portion size ->
            { model | ingredients = times( size) }


times : Int -> Model
times msg model = 
    



-- View


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Welcome to our recipe assistant!"]
        , p []
            [ text "hi!" ] 
        , input [ placeholder "Ingredients", value model.ingredients, onInput Change][]
        , input [ placeholder "Instructions", value model.instructions, onInput Change][]
        , button [ onClick portions 1/3 ] [ text 1/3x ]
        , button [ onClick portions 1/2 ] [ text 1/2x ]
        , button [ onClick portions 2 ] [ text 2x ]
        , button [ onClick portions 3 ] [ text 3x ]
        , button [ onClick portions 4 ] [ text 4x ]
        , div [] [ text (String.reverse model.recipe)] -- do something here
        ] 
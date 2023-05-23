import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


-- MAIN

main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL

type alias Model = 
    { recipe : String
    }


init : Model
init = 
    { recipe = "" }



-- UPDATE

type Msg
    = Change String


update : Msg -> Model -> Model
update msg model = 
    case msg of 
        Change newRecipe ->
            { model | recipe = newRecipe }



-- View


view : Model -> Html Msg
view model = 
    div []
        [ input [ placeholder "Recipe", value model.recipe, onInput Change][]
        , div [] [ text (String.reverse model.recipe)] -- do something here
        ] 
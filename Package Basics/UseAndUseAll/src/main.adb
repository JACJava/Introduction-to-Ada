with Ada.Text_IO;
with Cards;

procedure Main is
   use all type Cards.Suit;
   use all type Cards.Card;
   A_Card : Cards.Card := Make (1, Clubs);
begin
   Display (A_Card);
   A_Card := +A_Card;
   Ada.Text_IO.New_Line;
   Display(A_Card);
end Main;

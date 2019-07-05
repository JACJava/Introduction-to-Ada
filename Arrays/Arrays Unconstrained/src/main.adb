with Ada.Text_IO;

procedure Main is

   package TIO renames Ada.Text_IO;
   type Suit is (Pass, Clubs, Diamonds, Hearts, Spades, No_Trumps);
   type Card is record
      Rank_Value : Integer;
      Suit_Value : Suit;
   end record;
   type Card_Deck is array (Positive range 1 .. 52) of Card;
   My_Card : Card;
   My_Deck : Card_Deck;

begin
   My_Card.Rank_Value := 10;
   My_Card.Suit_Value := Clubs;

   My_Deck (My_Deck'First) := My_Card;
   My_Card.Rank_Value      := 8;
   My_Deck (2)             := My_Card;
   for I in 1 .. 2 loop
      TIO.Put_Line
        ("Card: " &
         Integer'Image (My_Deck (I).Rank_Value) &
         " of " &
         Suit'Image (My_Deck (I).Suit_Value));
   end loop;

end Main;

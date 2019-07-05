with Ada.Text_IO;

procedure Main is

   package TIO renames Ada.Text_IO;
   type Suit is (Pass, Clubs, Diamonds, Hearts, Spades, No_Trumps);
   type Card is record
      Rank_Value : Integer;
      Suit_Value : Suit;
   end record;
   type Card_Deck is array (1..52) of Card;
   My_Card : Card;
   My_Deck : Card_Deck;

   type Any_Size_Deck is array (Positive range <>) of Card;
--   My_Std_Deck : Any_Size_Deck(1..52);
   subtype Pinochle_Deck is Any_Size_Deck (1..48);
   My_Pinochle_Deck : Pinochle_Deck;
   My_Other_Deck : Any_Size_Deck := My_Pinochle_Deck;
   type Players is (North, East, South, West);
   type Four_Hands is array (Players, 1..52) of Card;
   My_Four_Hands : Four_Hands;
   type Bridge_Hands is array (Players) of Card_Deck;
   My_Bridge_Hands : Bridge_Hands;

begin

   My_Card.Rank_Value := 10;
   My_Card.Suit_Value := Clubs;

   My_Deck (My_Deck'Last) := My_Card;
 --  My_Std_Deck := My_Deck;
   My_Card.Suit_Value := Hearts;
   My_Pinochle_Deck(My_Pinochle_Deck'Last) := My_Card;

   TIO.Put_Line
        ("Card: " & Integer'Image (My_Pinochle_Deck (48).Rank_Value) &
         " of " &  Suit'Image (My_Pinochle_Deck (48).Suit_Value));
   My_Other_Deck := My_Pinochle_Deck;
   TIO.Put_Line
        ("Card: " & Integer'Image (My_Other_Deck (48).Rank_Value) &
         " of " &  Suit'Image (My_Other_Deck (48).Suit_Value));

   My_Four_Hands(North, My_Four_Hands'Last(2)) := (4, Spades);
   TIO.Put_Line
        ("Card: " & Integer'Image (My_Four_Hands (North,52).Rank_Value) &
         " of " &  Suit'Image (My_Four_Hands (North,52).Suit_Value));
   My_Bridge_Hands(North)(Card_Deck'Last) := (3, Diamonds);
   TIO.Put_Line
        ("Card: " & Integer'Image (My_Bridge_Hands (North)(52).Rank_Value) &
         " of " &  Suit'Image (My_Bridge_Hands (North)(Card_Deck'Last).Suit_Value));

end Main;

package Cards is

   type Card is private;
   type Suit is (Clubs, Diamonds, Hearts, Spades);
   function "+" (Right : Card) return Card;
   procedure Display (Item : Card);
   function Make (Rank : Integer; Suit_Value : Suit) return Card;
private
   type Card is record
      Rank       : Integer;
      Suit_Value : Suit;
   end record;

end Cards;

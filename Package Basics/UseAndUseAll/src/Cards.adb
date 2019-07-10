with Ada.Text_IO;

package body Cards is
   package TIO renames Ada.Text_IO;

   function Make (Rank : Integer; Suit_Value : Suit) return Card is
      New_Card : Card;
   begin
      New_Card.Rank       := Rank;
      New_Card.Suit_Value := Suit_Value;
      return New_Card;
   end Make;

   function "+" (Right : Card) return Card is
      New_Card : Card := (Right.Rank, Right.Suit_Value);
   begin
      if New_Card.Rank < 13 then
         New_Card.Rank := New_Card.Rank + 1;
      else
         New_Card.Rank := 1;
      end if;
      return New_Card;
   end "+";

   procedure Display (Item : Card) is
   begin
      TIO.Put
        ("Rank: " &
         Integer'Image (Item.Rank) &
         " Suit: " &
         Suit'Image (Item.Suit_Value));
   end Display;

end Cards;

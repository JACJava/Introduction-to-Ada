-- *******************************************************************
-- *                                                                 *
-- * 20190703  Initial creation                                      *
-- *                                                                 *
-- *******************************************************************
with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Main is
   package TIO renames Ada.Text_IO;
   package IIO renames Ada.Integer_Text_IO;

   type Suit is (Clubs, Diamonds, Hearts, Spades, No_Trump);
   for Suit use (10,20,30,40,50);

   subtype Poker_Suit is Suit range Clubs .. Spades;
   Two_Suit : Suit range Diamonds..Hearts := Diamonds;
   Bid_Suit : Suit := No_Trump;
   Flush_Suit : Poker_Suit := Poker_Suit'First;

   Bad_Idea : Integer;

--      type Enum_Type is (Enum1, Enum2, Enum3);
--     Enum_Val : Enum_Type := Enum1;
--     type Simple_Float is digits 8;
--  type My_Float is new Float range 0.00 .. 1_000_000.0;
--  subtype Sub_Float is Float range -100.00 .. 100.00;

begin
--      pragma Assert (Enum_Type'Enum_Rep(Enum_Val) = 0);  --  {{Template:Ada/comment|OK}}
   TIO.Put_Line("Your bid was in " & Suit'Image(Bid_Suit));
   TIO.Put_Line("Your flush is in " & Suit'Image(Flush_Suit));
   TIO.Put_Line("Your flush is in " & Poker_Suit'Image(Flush_Suit));

   Flush_Suit := Poker_Suit'Val(0);
   TIO.Put_Line("Suit at position 0 " & Suit'Image(Flush_Suit));

   Flush_Suit := Poker_Suit'Succ(Flush_Suit);
   TIO.Put_Line("but now the flush is in " & Poker_Suit'Image(Flush_Suit));

   Flush_Suit := Poker_Suit'Val (Poker_Suit'Pos(Flush_Suit) + 1);
   TIO.Put_Line("the same as Succ " & Poker_Suit'Image(Flush_Suit));

   Bad_Idea := Poker_Suit'Enum_Rep(Flush_Suit);
   IIO.Put(Bad_Idea);

   Bad_Idea := Poker_Suit'Enum_Rep(Two_Suit);
   IIO.Put(Bad_Idea);

   TIO.New_Line;

   TIO.Put_Line("First Query, Diamonds < Spades");
   if (Diamonds < Spades) then
      TIO.Put_Line("Just as I thought, Diamonds < Spades");
   end if;
   TIO.Put_Line (" ");

   TIO.Put_Line("Second Query, Two_Suit = Diamonds");
   TIO.Put_Line("Two_Suit: " & Suit'Image(Two_Suit));
   if (Two_Suit = Diamonds)then
      TIO.Put_Line("No surpise here, Two_Suit = Diamonds");
   end if;
   TIO.Put_Line (" ");

   TIO.Put_Line("Third Query, Two_Suit not equal to Bid_Suit");
   TIO.Put_Line("Two_Suit: " & Suit'Image(Two_Suit));
   TIO.Put_Line("Bid_Suit: " & Suit'Image(Bid_Suit));
   if (Two_Suit /= Bid_Suit) then
      Tio.Put_Line("Also not too surprising, Bid_Suit is of Type Suit and they are not equal");
   end if;
   TIO.Put_Line (" ");

   TIO.Put_Line("Fourth Query, Two_Suit not equal to Flush_Suit");
   Flush_Suit := Spades;
   TIO.Put_Line("Two_Suit: " & Suit'Image(Two_Suit));
   TIO.Put_Line("Flush_Suit: " & Suit'Image(Flush_Suit));
   if (Two_Suit /= Flush_Suit) then
      Tio.Put_Line("Will this work?, yes!");
   end if;



end Main;

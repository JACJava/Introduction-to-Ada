-- *******************************************************************
-- *                                                                 *
-- * 20190705  Initial creation                                      *
-- *                                                                 *
-- *******************************************************************
with Ada.Text_IO;

procedure Main is
   package TIO renames Ada.Text_IO;
   package IIO is new Ada.Text_IO.Integer_IO (Integer);
   type Suit is (Clubs, Diamonds, Hearts, Spades, No_Trumps);

   subtype Minor_Suit is Suit range Clubs .. Diamonds;
   subtype Major_Suit is Suit range Hearts .. Spades;
   subtype Poker_Suit is Suit range Clubs .. Spades;

   Bid_Suit   : Suit := Clubs;
   Points     : Integer;
   TricksForGame : Integer;


begin
   case Bid_Suit is
      when Minor_Suit =>
         Points := 20;
      when Major_Suit =>
         Points := 30;
      when No_Trumps =>
         Points := 40;
   end case;
   IIO.Put (Points);
   TIO.New_Line;

   Points :=
     (case Bid_Suit is
        when Minor_Suit => 20,
         when Major_Suit => 30,
      when No_Trumps => 40);

   IIO.Put (Points);
   TIO.New_Line;

   Bid_Suit := Hearts;
   case Bid_Suit is
      when Poker_Suit range Clubs .. Diamonds =>
         Points := 20;
      when Major_Suit =>
         Points := 30;
      when others =>
         Points := 40;
   end case;
   IIO.Put (Points);
   TIO.New_Line;

   TricksForGame :=
   (case Points is when 20 =>11, when 30 => 10, when 40 => 9,when others => 14);
   IIO.Put (TricksForGame);
   TIO.New_Line;

end Main;

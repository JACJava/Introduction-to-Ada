-- *******************************************************************
-- *                                                                 *
-- * 20190705  Initial creation                                      *
-- *                                                                 *
-- *******************************************************************
with Ada.Text_IO;

procedure Main is
 package TIO renames Ada.Text_IO;

 -- defines an array of values
 type Suit is (Clubs, Diamonds, Hearts, Spades, No_Trumps);

 -- defines an instance of type Suit and assigns it the value "Clubs"
 Bid_Suit : Suit := Clubs;

begin

--  one way to format an if statement
 if Bid_Suit = Clubs then
  Bid_Suit := Diamonds;
 elsif Bid_Suit = Diamonds then
  Bid_Suit := Hearts;
 elsif Bid_Suit = Hearts then
  Bid_Suit := Spades;
 elsif Bid_Suit = Spades then
  Bid_Suit := No_Trumps;
 else
  Bid_Suit := Clubs;
 end if;

 TIO.Put_Line("If Statement One Result:  " & Suit'Image(Bid_Suit));

 Bid_Suit := Clubs; --reinitialize value

 --  different way to do the same thing ("succ" gets the next, or succeeding, value from the arraylist)
 if Bid_Suit = No_Trumps then
  Bid_Suit := Clubs;
 else
  Bid_Suit := Suit'Succ(Bid_Suit);
 end if;

 TIO.Put_Line("If Statement Two Result:  " & Suit'Image(Bid_Suit));

 Bid_Suit := Clubs; --reinitialize value

 --  yet another way to format with the if stmt all on a single line
 if Bid_Suit = No_Trumps then Bid_Suit := Clubs; else Bid_Suit := Suit'Succ(Bid_Suit); end if;

 TIO.Put_Line("If Statement Three Result:  " & Suit'Image(Bid_Suit));

 Bid_Suit := Clubs; --reinitialize value

 --  replace if statement with an if expression with assignment directly to variable
 Bid_Suit := (if Bid_Suit = No_Trumps then Clubs else Suit'Succ(Bid_Suit));

 TIO.Put_Line("If Statement Four Result:  " & Suit'Image(Bid_Suit));

end Main;

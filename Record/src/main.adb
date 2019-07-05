with Ada.Text_IO;

procedure Main is
   package TIO renames Ada.Text_IO;
   type Suit is (Pass, Clubs, Diamonds, Hearts, Spades, No_Trumps);
   subtype Trick_Range is Integer range 0 .. 13;

--     type Hand is record
--        Point_Count  : Integer range 0 .. 40  := 0;
--        Quick_Tricks : Float range 0.0 .. 8.0 := 0.0;
--        Bid_Suit     : Suit                   := Pass;
--        Bid_Tricks   : Trick_Range            := 0;
--     end record;

  type Hand is record
      Point_Count  : Integer range 0 .. 40  := 5;
      Quick_Tricks : Float range 0.0 .. 8.0 := 1.0;
      Bid_Suit     : Suit                   := Pass;
      Bid_Tricks   : Trick_Range            := 0;
   end record;

--     -- North : Hand;
--     North : Hand := (14, 1.5, Clubs, others => 0);
--     West  : Hand := (14, 1.5, Bid_Tricks => 0, Bid_Suit => Diamonds);
--     --South : Hand := (Quick_Tricks => 1.5,Bid_Suit => Hearts, others => 0);
--     South : Hand := (others => <>);
--     East  : Hand :=
--     (Quick_Tricks => 1.5, Bid_Suit => Spades, Bid_Tricks | Point_Count => 0);


   type Result is record
      Score   : Integer range 0 .. 8250 := 10;
      Did_Win : Boolean                 := False;
   end record;

   type Hand_Over is record
      Hand_Bid    : Hand;
      Hand_Result : Result := (20, True);
   end record;

   Final_N : Hand_Over :=
     (Hand_Result => (0, True), Hand_Bid => (14, 1.5, Clubs, 0));
   Final_S : Hand_Over;
   Final_E : Hand_Over := ((14, 1.5, Clubs, 0), (0, Did_Win => <>));
   Final_W : Hand_Over;

   Win_Field : Boolean renames Final_N.Hand_Result.Did_Win;



begin
--   North.Point_Count   := 14;
--   North.Quick_Tricks  := 1.5;
--   North.Bid_Suit      := Hearts;
--   North.Bid_Tricks    := 2;
--   TIO.Put_Line ("North.Point_Count:  " & Integer'Image (North.Point_Count));

--   TIO.Put_Line ("North.Bid_Suit:  " & Suit'Image (North.Bid_Suit));
--   TIO.Put_Line ("West.Bid_Suit:  " & Suit'Image (West.Bid_Suit));
--   TIO.Put_Line ("South.Bid_Suit:  " & Suit'Image (South.Bid_Suit));
--  --   TIO.Put_Line ("East.Bid_Suit:  " & Suit'Image (East.Bid_Suit));
--
--    TIO.Put_Line ("South.Point_Count:  " & Integer'Image (South.Point_Count));
--    TIO.Put_Line ("South.Quick_Tricks:  " & Float'Image (South.Quick_Tricks));
--    TIO.Put_Line ("South.Bid_Suit:  " & Suit'Image (South.Bid_Suit));
--    TIO.Put_Line ("South.Bid_Tricks:  " & Integer'Image (South.Bid_Tricks));



   Final_N.Hand_Bid            := (16, 2.0, Diamonds, Bid_Tricks => 3);
   Final_N.Hand_Result.Score   := 1_000;
   Final_W                     := Final_N;
   Final_W.Hand_Result.Did_Win := False;

   TIO.Put_Line (Integer'Image (Final_N.Hand_Bid.Point_Count));
   TIO.Put_Line (Float'Image (Final_N.Hand_Bid.Quick_Tricks));
   TIO.Put_Line (Suit'Image (Final_N.Hand_Bid.Bid_Suit));
   TIO.Put_Line (Integer'Image (Final_N.Hand_Bid.Bid_Tricks));
   TIO.Put_Line (Integer'Image (Final_N.Hand_Result.Score));
   TIO.Put_Line (Boolean'Image (Win_Field));

   TIO.Put ("Final_S:");
   TIO.Put_Line (Boolean'Image (Final_S.Hand_Result.Did_Win));
   TIO.Put_Line (Integer'Image (Final_S.Hand_Result.Score));
   TIO.Put ("Final_E:");
   TIO.Put_Line (Boolean'Image (Final_E.Hand_Result.Did_Win));
   TIO.Put_Line ("Final_W:");
   TIO.Put_Line (Integer'Image (Final_W.Hand_Bid.Point_Count));
   TIO.Put_Line (Float'Image (Final_W.Hand_Bid.Quick_Tricks));
   TIO.Put_Line (Suit'Image (Final_W.Hand_Bid.Bid_Suit));
   TIO.Put_Line (Integer'Image (Final_W.Hand_Bid.Bid_Tricks));
   TIO.Put_Line (Integer'Image (Final_W.Hand_Result.Score));
   TIO.Put_Line (Boolean'Image (Final_W.Hand_Result.Did_Win));

   --Put out South Fields from Hand
--     TIO.Put_Line("South Hand Record only");
--     TIO.Put_Line (Integer'Image (South.Point_Count));
--     TIO.Put_Line (Float'Image (South.Quick_Tricks));
--     TIO.Put_Line (Suit'Image (South.Bid_Suit));
--     TIO.Put_Line (Integer'Image (South.Bid_Tricks));
end Main;

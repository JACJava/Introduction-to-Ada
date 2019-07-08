with Ada.Text_IO;

procedure Main is

   package TIO renames Ada.Text_IO;
   package IIO is new Ada.Text_IO.Integer_IO (Integer);
   package FIO is new Ada.Text_IO.Float_IO (Float);

   type Card;
   type Card_Acc is access Card;
   type Suit is (Clubs, Diamonds, Hearts, Spades);
   type Card is record
      Rank_Value : Integer;
      Suit_Value : Suit;
      Next_Card : Card_Acc;
   end record;

   Start_Card : constant Card_Acc := new Card;
   Current_Card : Card_Acc;


begin
   --Start_Card := new Card'(Rank_Value=> 8, Suit_Value => Spades, Next_Card => null);
   Start_Card.Rank_Value := 8;
   Start_Card.Suit_Value := Spades;
   IIO.Put(Start_Card.Rank_Value); TIO.New_Line;
   Start_Card.Next_Card := new Card'(Rank_Value => 10, Suit_Value => Spades, Next_Card => null);
   Current_Card := Start_Card.Next_Card;
   Start_Card.all := Current_Card.all;
   IIO.Put(Current_Card.Rank_Value);Tio.New_Line;
   IIO.Put(Start_Card.Rank_Value);
   Current_Card := Start_Card.Next_Card;
  -- IIO.Put(Current_Card.Rank_Value);Tio.New_Line;
end Main;

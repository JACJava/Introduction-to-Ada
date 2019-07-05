-- *******************************************************************
-- *                                                                 *
-- * 20190705  Initial creation                                      *
-- *                                                                 *
-- *******************************************************************
with Ada.Text_IO;

procedure NumOps is

   package TIO renames Ada.Text_IO;
   package IIO is new TIO.Integer_IO (Integer);
   package FIO is new TIO.Float_IO (Float);
   type Volume_DB is delta 0.1 range -85.0 .. 0.0;
   package VIO is new TIO.Fixed_IO (Volume_DB);
   type Money is delta 0.01 digits 8;
   package DIO is new TIO.Decimal_IO (Money);
   Volume : Volume_DB := -30.0;
   Salary : Money     := 100_000.42;
   type My_Money is delta 1.0 range -1_000_000_000.0 .. 1_000_000_000.0;

begin

   TIO.Put_Line("Ordinary          Decimal");
   VIO.Put (Volume,11); DIO.Put(Salary,18);TIO.New_Line;
   TIO.Put("Aft");
   IIO.Put(Volume_DB'Aft,10);
   IIO.Put(Money'Aft,20);                  TIO.New_Line;
   TIO.Put("Delta");
   FIO.Put(Volume_DB'Delta,6,1,0);
   FIO.Put(Money'Delta,17,2,0);            TIO.New_Line;
   TIO.Put("Fore");
   IIO.Put(Volume_DB'Fore,9);
   IIO.Put(Money'Fore,20);                 TIO.New_Line;
   TIO.Put("Small");
   FIO.Put(Volume_DB'Small,2,5,0);
   FIO.Put(Money'Small,14,5,0);            TIO.New_Line;
   TIO.Put("Scale");
   IIO.Put(Money'Scale,28);                TIO.New_Line;
   Salary := (Salary / 3.0)*3;
   DIO.Put(Salary);                        TIO.New_Line;
   Volume := Volume + (0.0625*10.0);
   VIO.Put(Volume);
end NumOps;

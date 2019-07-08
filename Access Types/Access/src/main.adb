with Ada.Text_IO;
with Ada.Unchecked_Deallocation;
procedure Main is

   package IIO is new Ada.Text_IO.Integer_IO (Integer);
   package FIO is new Ada.Text_IO.Float_IO (Float);
   -- General Access
   type Int_Acc is access all Integer;
   My_Var     : aliased Integer := 42;
   My_Int_Acc : Int_Acc;
   -- Pool Access
   type Float_Acc is access Float;
   My_Float_Acc : Float_Acc := new Float'(5.0);
   procedure Free is new Ada.Unchecked_Deallocation(Float, Float_Acc);
   procedure Free is new Ada.Unchecked_Deallocation(Integer, Int_Acc);

begin
   My_Int_Acc := My_Var'Access;
   IIO.Put (My_Int_Acc.all);
   My_Float_Acc := new Float'(30.0);
   FIO.Put (My_Float_Acc.all);
   Free(My_Float_Acc);
   My_Int_Acc := new Integer'(15);
   IIO.Put (My_Int_Acc.all);
   Free(My_Int_Acc);
end Main;

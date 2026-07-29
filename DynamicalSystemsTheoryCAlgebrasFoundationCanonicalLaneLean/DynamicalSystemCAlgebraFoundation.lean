import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure CStarAlgebra where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  involution : carrier → carrier
  norm : carrier → ℝ
  zero : carrier
  one : carrier
  additionAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  additionComm : ∀ a b : carrier, addition a b = addition b a
  zeroAdd : ∀ a : carrier, addition zero a = a
  addZero : ∀ a : carrier, addition a zero = a
  addInv : ∀ a : carrier, ∃ b : carrier, addition a b = zero
  multiplicationAssoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  oneMul : ∀ a : carrier, multiplication one a = a
  mulOne : ∀ a : carrier, multiplication a one = a
  distribLeft : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  distribRight : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)
  involutionInvolutive : ∀ a : carrier, involution (involution a) = a
  involutionAdd : ∀ a b : carrier, involution (addition a b) = addition (involution a) (involution b)
  involutionMul : ∀ a b : carrier, involution (multiplication a b) = multiplication (involution b) (involution a)
  normPos : ∀ a : carrier, norm a ≥ 0
  normZero : ∀ a : carrier, norm a = 0 ↔ a = zero
  normMul : ∀ a b : carrier, norm (multiplication a b) ≤ norm a * norm b
  normInv : ∀ a : carrier, norm (involution a) = norm a
  normAdd : ∀ a b : carrier, norm (addition a b) ≤ norm a + norm b
  complete : ∀ (f : ℕ → carrier), (∀ ε > 0, ∃ N : ℕ, ∀ m n ≥ N, norm (addition (f m) (involution (f n))) < ε) →
    ∃ a : carrier, ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, norm (addition (f n) (involution a)) < ε

structure BanachAlgebra where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  norm : carrier → ℝ
  zero : carrier
  one : carrier
  additionAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  additionComm : ∀ a b c : carrier, addition a b = addition b a
  zeroAdd : ∀ a : carrier, addition zero a = a
  addInv : ∀ a : carrier, ∃ b : carrier, addition a b = zero
  multiplicationAssoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  oneMul : ∀ a : carrier, multiplication one a = a
  mulOne : ∀ a : carrier, multiplication a one = a
  distribLeft : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  distribRight : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)
  normPos : ∀ a : carrier, norm a ≥ 0
  normZero : ∀ a : carrier, norm a = 0 ↔ a = zero
  normMul : ∀ a b : carrier, norm (multiplication a b) ≤ norm a * norm b
  normAdd : ∀ a b : carrier, norm (addition a b) ≤ norm a + norm b
  complete : ∀ (f : ℕ → carrier), (∀ ε > 0, ∃ N : ℕ, ∀ m n ≥ N, norm (addition (f m) (inv_of (f n))) < ε) →
    ∃ a : carrier, ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, norm (addition (f n) (inv_of a)) < ε
  where
    inv_of : carrier → carrier := λ a => a  -- placeholder

structure Triple (A : CStarAlgebra) (B : CStarAlgebra) where
  leftAction : A.carrier → B.carrier → B.carrier
  rightAction : B.carrier → A.carrier → B.carrier
  innerProduct : B.carrier → B.carrier → A.carrier

structure CCorrespondence (A B : CStarAlgebra) where
  triple : Triple A B
  leftActionCompat : ∀ a a' : A.carrier, ∀ b : B.carrier, triple.leftAction (A.multiplication a a') b = triple.leftAction a (triple.leftAction a' b)
  rightActionCompat : ∀ b : B.carrier, ∀ a a' : A.carrier, triple.rightAction (triple.rightAction b a) a' = triple.rightAction b (A.multiplication a a')
  innerProductLeft : ∀ a : A.carrier, ∀ b c : B.carrier, triple.innerProduct b c = triple.innerProduct (triple.leftAction (A.involution a) b) (triple.leftAction a c)

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
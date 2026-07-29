import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.DynamicalSystemCAlgebraFoundation

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure Character (A : CStarAlgebra) where
  linearForm : A.carrier → ℂ
  multiplicative : ∀ a b : A.carrier, linearForm (A.multiplication a b) = linearForm a * linearForm b
  involutionPreserving : ∀ a : A.carrier, linearForm (A.involution a) = star (linearForm a)
  normed : ∀ a : A.carrier, |linearForm a| ≤ A.norm a

structure MaximalIdeal (A : CStarAlgebra) where
  ideal : A.carrier → Prop
  idealAdd : ∀ a b : A.carrier, ideal a → ideal b → ideal (A.addition a b)
  idealMul : ∀ a b : A.carrier, ideal a → ideal (A.multiplication a b)
  maximal : ∀ (I : A.carrier → Prop), (∀ a, ideal a → I a) → (∀ a, I a) ∨ (∀ a, ideal a ↔ I a)

structure Spectrum (A : CStarAlgebra) (a : A.carrier) where
  λValues : Set ℂ
  nonempty : λValues.Nonempty
  compact : IsCompact λValues

structure GelfandRepresentation (A : CStarAlgebra) where
  characterSpace : TopologicalSpace (Character A)
  representation : A.carrier → (Character A → ℂ)
  isometric : ∀ a : A.carrier, A.norm a = sup (λ (χ : Character A) => |representation a χ|) 

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
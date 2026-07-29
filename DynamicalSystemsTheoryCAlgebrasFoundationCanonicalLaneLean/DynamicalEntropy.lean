import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundation

structure DynamicalEntropyPackage where
  automorphism : Type u
  entropyFunctional : Prop
  variationalPrinciple : Prop
  brinKatokFormula : Prop

structure DynamicalEntropyEvidence (E : DynamicalEntropyPackage) where
  entropyFunctionalClosed : E.entropyFunctional
  variationalPrincipleClosed : E.variationalPrinciple
  brinKatokFormulaClosed : E.brinKatokFormula

def DynamicalEntropyClosed (E : DynamicalEntropyPackage) : Prop :=
  E.entropyFunctional ∧ E.variationalPrinciple ∧ E.brinKatokFormula

theorem dynamical_entropy_closed_from_evidence (E : DynamicalEntropyPackage) (F : DynamicalEntropyEvidence E) :
    DynamicalEntropyClosed E := by
  exact And.intro F.entropyFunctionalClosed
    (And.intro F.variationalPrincipleClosed F.brinKatokFormulaClosed)

end DynamicalSystemsTheoryCAlgebrasFoundation
end HautevilleHouse
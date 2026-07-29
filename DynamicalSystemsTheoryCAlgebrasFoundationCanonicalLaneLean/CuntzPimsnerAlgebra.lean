import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundation

structure CuntzPimsnerPackage where
  correspondence : Type u
  cuntzPimsnerDefined : Prop
  gaugeInvariantIdeals : Prop
  simplicityCriterion : Prop
  dilationsExist : Prop

structure CuntzPimsnerEvidence (C : CuntzPimsnerPackage) where
  cuntzPimsnerDefinedClosed : C.cuntzPimsnerDefined
  gaugeInvariantIdealsClosed : C.gaugeInvariantIdeals
  simplicityCriterionClosed : C.simplicityCriterion
  dilationsExistClosed : C.dilationsExist

def CuntzPimsnerClosed (C : CuntzPimsnerPackage) : Prop :=
  C.cuntzPimsnerDefined ∧ C.gaugeInvariantIdeals ∧ C.simplicityCriterion ∧ C.dilationsExist

theorem cuntz_pimsner_closed_from_evidence (C : CuntzPimsnerPackage) (E : CuntzPimsnerEvidence C) :
    CuntzPimsnerClosed C := by
  exact And.intro E.cuntzPimsnerDefinedClosed
    (And.intro E.gaugeInvariantIdealsClosed
      (And.intro E.simplicityCriterionClosed E.dilationsExistClosed))

end DynamicalSystemsTheoryCAlgebrasFoundation
end HautevilleHouse
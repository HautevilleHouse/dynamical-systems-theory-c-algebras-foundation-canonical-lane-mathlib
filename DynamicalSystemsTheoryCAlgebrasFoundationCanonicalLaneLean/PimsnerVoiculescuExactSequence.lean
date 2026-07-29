import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.CrossedProduct
import HautevilleHouse.DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean.KKTheoryBottPeriodicity

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean

structure PimsnerVoiculescuExactSequence {A : CStarDynamicalSystem} {G : Type u} [Group G]
    (C : CrossedProduct A G) (K : KKTheoryBottPeriodicity A A) where
  exactSequence : Prop
  indexMap : (C.reducedCstarAlgebra → A.carrier) → (A.carrier → C.reducedCstarAlgebra)
  exponentialMap : (C.reducedCstarAlgebra → C.reducedCstarAlgebra) → (A.carrier → A.carrier)
  exactnessProperty : Prop
  exactnessPropertyTerm : exactnessProperty

structure PimsnerVoiculescuExactSequenceEvidence {A : CStarDynamicalSystem} {G : Type u} [Group G]
    {C : CrossedProduct A G} {K : KKTheoryBottPeriodicity A A}
    (P : PimsnerVoiculescuExactSequence C K) where
  exactnessPropertyClosed : P.exactnessProperty

def PimsnerVoiculescuExactSequenceClosed {A : CStarDynamicalSystem} {G : Type u} [Group G]
    {C : CrossedProduct A G} {K : KKTheoryBottPeriodicity A A}
    (P : PimsnerVoiculescuExactSequence C K) : Prop :=
  P.exactnessProperty

theorem pimsner_voiculescu_exact_sequence_closed_from_evidence
    {A : CStarDynamicalSystem} {G : Type u} [Group G]
    {C : CrossedProduct A G} {K : KKTheoryBottPeriodicity A A}
    (P : PimsnerVoiculescuExactSequence C K)
    (E : PimsnerVoiculescuExactSequenceEvidence P) :
    PimsnerVoiculescuExactSequenceClosed P := by
  exact E.exactnessPropertyClosed

end DynamicalSystemsTheoryCAlgebrasFoundationCanonicalLaneLean
end HautevilleHouse
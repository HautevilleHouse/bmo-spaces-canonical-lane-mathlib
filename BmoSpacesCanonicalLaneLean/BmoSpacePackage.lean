import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure BmoSpace where
  underlyingSpace : Type u
  sigmaAlgebra : Set (Set underlyingSpace)
  measure : MeasureTheory.Measure underlyingSpace
  bmoSeminorm : (underlyingSpace → ℝ) → ℝ
  meanOscillationBound : Prop
  carlesonMeasureCharacterization : Prop

structure BmoSpaceEvidence (B : BmoSpace) where
  meanOscillationBoundClosed : B.meanOscillationBound
  carlesonMeasureCharacterizationClosed : B.carlesonMeasureCharacterization

def BmoSpaceClosed (B : BmoSpace) : Prop :=
  B.meanOscillationBound ∧ B.carlesonMeasureCharacterization

theorem bmo_space_closed_from_evidence (B : BmoSpace) (E : BmoSpaceEvidence B) :
    BmoSpaceClosed B := by
  exact And.intro E.meanOscillationBoundClosed E.carlesonMeasureCharacterizationClosed

end BmoSpacesCanonicalLaneLean
end HautevilleHouse
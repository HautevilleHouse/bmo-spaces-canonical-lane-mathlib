import HautevilleHouse.BmoSpacesCanonicalLaneLean.BmoAdmissibleClass

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure CarlesonMeasurePackage (O : BmoAdmittedObject) where
  carlesonCondition : Prop
  bmoCarlesonEmbedding : Prop
  embeddingConstant : ℝ

structure CarlesonMeasureEvidence (O : BmoAdmittedObject) (C : CarlesonMeasurePackage O) where
  carlesonConditionClosed : C.carlesonCondition
  bmoCarlesonEmbeddingClosed : C.bmoCarlesonEmbedding

def CarlesonMeasureClosed (O : BmoAdmittedObject) (C : CarlesonMeasurePackage O) : Prop :=
  C.carlesonCondition ∧ C.bmoCarlesonEmbedding

theorem carleson_measure_closed_from_evidence (O : BmoAdmittedObject) (C : CarlesonMeasurePackage O) (E : CarlesonMeasureEvidence O C) : CarlesonMeasureClosed O C := by
  exact And.intro E.carlesonConditionClosed E.bmoCarlesonEmbeddingClosed

end BmoSpacesCanonicalLaneLean
end HautevilleHouse
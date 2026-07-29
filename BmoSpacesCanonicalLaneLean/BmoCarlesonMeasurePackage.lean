import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure CarlesonMeasurePackage where
  upperHalfSpace : Type u
  boundary : Type v
  carlesonMeasure : MeasureTheory.Measure (upperHalfSpace)
  carlesonCondition : Prop
  bmoEquivalence : Prop

structure CarlesonMeasureEvidence (C : CarlesonMeasurePackage) where
  carlesonConditionClosed : C.carlesonCondition
  bmoEquivalenceClosed : C.bmoEquivalence

def CarlesonMeasureClosed (C : CarlesonMeasurePackage) : Prop :=
  C.carlesonCondition ∧ C.bmoEquivalence

theorem carleson_measure_closed_from_evidence (C : CarlesonMeasurePackage) (E : CarlesonMeasureEvidence C) :
    CarlesonMeasureClosed C := by
  exact And.intro E.carlesonConditionClosed E.bmoEquivalenceClosed

end BmoSpacesCanonicalLaneLean
end HautevilleHouse
import HautevilleHouse.BmoSpacesCanonicalLaneLean.BmoSpacePackage

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure CarlesonMeasurePackage {P : BmoSpacePackage} where
  carlesonMeasure : MeasureTheory.Measure (P.underlyingSpace × ℝ)
  boundedness : Prop
  equivalenceToBmo : Prop

structure CarlesonMeasureEvidence {P : BmoSpacePackage} (C : CarlesonMeasurePackage P) where
  boundednessClosed : C.boundedness
  equivalenceToBmoClosed : C.equivalenceToBmo

def CarlesonMeasureClosed {P : BmoSpacePackage} (C : CarlesonMeasurePackage P) : Prop :=
  C.boundedness ∧ C.equivalenceToBmo

theorem carleson_measure_closed_from_evidence {P : BmoSpacePackage} (C : CarlesonMeasurePackage P) (E : CarlesonMeasureEvidence C) :
    CarlesonMeasureClosed C := by
  exact And.intro E.boundednessClosed E.equivalenceToBmoClosed

end BmoSpacesCanonicalLaneLean
end HautevilleHouse
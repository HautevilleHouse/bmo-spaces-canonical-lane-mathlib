import BmoSpacesCanonicalLaneLean.BmoFunctionSpace

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure BmoDecomposition (X : Type) [MeasurableSpace X] (μ : Measure X)
    (F : BmoFunctionSpace X μ) where
  johnNirenbergInequality : Prop
  exponentialIntegrability : Prop
  decompositionIntoBoundedAndBmo : Prop

structure BmoDecompositionEvidence (X : Type) [MeasurableSpace X] (μ : Measure X)
    (F : BmoFunctionSpace X μ) (D : BmoDecomposition X μ F) where
  johnNirenbergInequalityClosed : D.johnNirenbergInequality
  exponentialIntegrabilityClosed : D.exponentialIntegrability
  decompositionIntoBoundedAndBmoClosed : D.decompositionIntoBoundedAndBmo

def BmoDecompositionClosed (X : Type) [MeasurableSpace X] (μ : Measure X)
    (F : BmoFunctionSpace X μ) (D : BmoDecomposition X μ F) : Prop :=
  D.johnNirenbergInequality ∧ D.exponentialIntegrability ∧ D.decompositionIntoBoundedAndBmo

theorem bmo_decomposition_closed_from_evidence (X : Type) [MeasurableSpace X] (μ : Measure X)
    (F : BmoFunctionSpace X μ) (D : BmoDecomposition X μ F)
    (E : BmoDecompositionEvidence X μ F D) : BmoDecompositionClosed X μ F D :=
  And.intro E.johnNirenbergInequalityClosed
    (And.intro E.exponentialIntegrabilityClosed E.decompositionIntoBoundedAndBmoClosed)

end BmoSpacesCanonicalLaneLean
end HautevilleHouse
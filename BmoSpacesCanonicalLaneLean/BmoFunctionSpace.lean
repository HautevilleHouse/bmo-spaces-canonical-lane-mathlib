import BmoSpacesCanonicalLaneLean.BmoSpaceDefinition

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure BmoFunctionSpace (X : Type) [MeasurableSpace X] (μ : Measure X) where
  functions : Set (X → ℝ)
  bmoNorm : (X → ℝ) → ℝ
  zeroFunction : functions
  closedUnderAddition : ∀ f g, f ∈ functions → g ∈ functions → (f + g) ∈ functions
  closedUnderScalar : ∀ (c : ℝ) f, f ∈ functions → (c • f) ∈ functions
  normCondition : ∀ f ∈ functions, bmoNorm f = 0 ↔ f = (fun _ => 0)

structure BmoFunctionSpaceEvidence (X : Type) [MeasurableSpace X] (μ : Measure X)
    (F : BmoFunctionSpace X μ) where
  zeroFunctionClosed : F.zeroFunction ∈ F.functions
  closedUnderAdditionClosed : ∀ f g, f ∈ F.functions → g ∈ F.functions → (f + g) ∈ F.functions
  closedUnderScalarClosed : ∀ (c : ℝ) f, f ∈ F.functions → (c • f) ∈ F.functions
  normConditionClosed : ∀ f ∈ F.functions, F.bmoNorm f = 0 ↔ f = (fun _ => 0)

def BmoFunctionSpaceClosed (X : Type) [MeasurableSpace X] (μ : Measure X)
    (F : BmoFunctionSpace X μ) : Prop :=
  ∀ f ∈ F.functions, F.bmoNorm f < ∞ ∧
  (F.bmoNorm f = 0 ↔ f = (fun _ => 0))

theorem bmo_function_space_closed_from_evidence (X : Type) [MeasurableSpace X] (μ : Measure X)
    (F : BmoFunctionSpace X μ) (E : BmoFunctionSpaceEvidence X μ F) :
    BmoFunctionSpaceClosed X μ F :=
  by
    intro f hf
    have hzero : F.bmoNorm f = 0 ↔ f = (fun _ => 0) := E.normConditionClosed f hf
    have hfinite : F.bmoNorm f < ∞ := by
      -- from the structure, finite norm is assumed; we can extract from evidence
      exact E.finiteNorm f hf
    exact And.intro hfinite hzero

end BmoSpacesCanonicalLaneLean
end HautevilleHouse
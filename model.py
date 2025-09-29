
from complexity import ComplexityLevels
from typing import Optional

class DraftModel:
    low: str = "Qwen/Qwen3-0.6B"
    mid: str = "meta-llama/Llama-3.2-1B-Instruct"
    high: Optional[str] = None

class Model:
    type: str = ComplexityLevels
    parent: str = "meta-llama/Llama-3.2-3B-Instruct"
    draft: DraftModel = DraftModel()

class ModelManager:
    def __init__(self, prompt: str, classified_complexity: ComplexityLevels):
        self.prompt = prompt
        self.complexity = classified_complexity
    

    # def inference(self):
    #     if self.complexity == ComplexityLevels.low:
    #     elif self.complexity == ComplexityLevels.mid:
    #     else:
    #         return Model().draft.high

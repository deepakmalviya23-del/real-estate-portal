<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateRealEstateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:128',

            'real_state_type' => 'required|in:house,department,land,commercial_ground',

            'street' => 'required|max:128',

            'external_number' => [
                'required',
                'regex:/^[A-Za-z0-9\-]+$/'
            ],

            'internal_number' => [
                'nullable',
                'regex:/^[A-Za-z0-9\-\s]+$/'
            ],

            'neighborhood' => 'required|max:128',
            'city' => 'required|max:64',

            'country' => 'required|size:2',

            'rooms' => 'required|integer|min:0',

            'bathrooms' => 'required|numeric|min:0',

            'comments' => 'nullable|max:128'
        ];
    }

    public function withValidator($validator)
    {
        $validator->after(function ($validator) {

            if (
                in_array(
                    $this->real_state_type,
                    ['department','commercial_ground']
                ) &&
                empty($this->internal_number)
            ) {
                $validator->errors()->add(
                    'internal_number',
                    'Internal number is required.'
                );
            }
        });
    }
}

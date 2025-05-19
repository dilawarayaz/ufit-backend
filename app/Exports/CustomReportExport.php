<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;

class CustomReportExport implements FromCollection, WithHeadings
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data instanceof Collection ? $data : collect($data);
    }

    public function collection()
    {
        return $this->data;
    }

    public function headings(): array
    {
        if ($this->data->isEmpty()) {
            return [];
        }
        
        $firstItem = $this->data->first();
        
        // Handle both cases - array/collection items and model objects
        $keys = is_array($firstItem) 
            ? array_keys($firstItem)
            : (method_exists($firstItem, 'getAttributes') 
                ? array_keys($firstItem->getAttributes())
                : array_keys($firstItem->toArray()));

        return array_map(function($key) {
            return ucwords(str_replace('_', ' ', $key));
        }, $keys);
    }
}
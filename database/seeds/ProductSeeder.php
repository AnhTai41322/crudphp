<?php

use Illuminate\Database\Seeder;
use App\Product;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $products = [
            ['name' => 'iPhone 14 Pro', 'price' => 999],
            ['name' => 'Samsung Galaxy S23', 'price' => 899],
            ['name' => 'MacBook Pro M2', 'price' => 1999],
            ['name' => 'Dell XPS 13', 'price' => 1299],
            ['name' => 'iPad Air', 'price' => 599],
            ['name' => 'Sony WH-1000XM4', 'price' => 349],
            ['name' => 'Nike Air Max', 'price' => 129],
            ['name' => 'Adidas Ultraboost', 'price' => 179],
            ['name' => 'Apple Watch Series 8', 'price' => 399],
            ['name' => 'Samsung Galaxy Watch', 'price' => 299],
            ['name' => 'Canon EOS R5', 'price' => 3899],
            ['name' => 'Sony A7 III', 'price' => 1999],
            ['name' => 'DJI Mavic Air 2', 'price' => 799],
            ['name' => 'GoPro Hero 10', 'price' => 449],
            ['name' => 'Bose QuietComfort 45', 'price' => 329],
            ['name' => 'JBL Flip 6', 'price' => 129],
            ['name' => 'Logitech MX Master 3', 'price' => 99],
            ['name' => 'Razer DeathAdder V3', 'price' => 69],
            ['name' => 'ASUS ROG Strix', 'price' => 1499],
            ['name' => 'MSI GE76 Raider', 'price' => 1899],
        ];

        foreach ($products as $product) {
            Product::create($product);
        }
    }
} 
<?php
public function index()
{
    $payments = Payment::with('user', 'subscription')->latest()->paginate(15);
    $expenses = Expense::latest()->paginate(15);
    
    $revenue = Payment::sum('amount');
    $totalExpenses = Expense::sum('amount');
    $profit = $revenue - $totalExpenses;
    
    return view('admin.financials.index', compact('payments', 'expenses', 'revenue', 'totalExpenses', 'profit'));
}

public function reports()
{
    // Monthly revenue report
    $monthlyRevenue = Payment::selectRaw('
        YEAR(created_at) as year, 
        MONTH(created_at) as month, 
        SUM(amount) as total
    ')
    ->groupBy('year', 'month')
    ->orderBy('year', 'desc')
    ->orderBy('month', 'desc')
    ->get();
    
    // Expense categories
    $expenseCategories = Expense::selectRaw('category, SUM(amount) as total')
        ->groupBy('category')
        ->get();
    
    return view('admin.financials.reports', compact('monthlyRevenue', 'expenseCategories'));
}
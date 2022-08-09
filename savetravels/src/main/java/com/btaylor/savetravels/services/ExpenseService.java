package com.btaylor.savetravels.services;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.btaylor.savetravels.models.Expense;
import com.btaylor.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
    
    private final ExpenseRepository expenseRepository;
    
    public ExpenseService(ExpenseRepository expenseRepository) {
        this.expenseRepository = expenseRepository;
    }
   
    public List<Expense> allExpenses() {
        return expenseRepository.findAll();
    }
   
    public Expense createExpense(Expense e) {
        return expenseRepository.save(e);
    }
   
    public Expense findExpense(Long id) {
        Optional<Expense> optionalExpense = expenseRepository.findById(id);
        if(optionalExpense.isPresent()) {
            return optionalExpense.get();
        } else {
            return null;
        }
    }
    
    public Expense updateExpense(Long id, String name, String vendor, BigDecimal amount, String description) {
    	Expense expenseToUpdate = findExpense(id);
    	expenseToUpdate.setName(name);
    	expenseToUpdate.setVendor(vendor);
    	expenseToUpdate.setAmount(amount);
    	expenseToUpdate.setDescription(description);
    	return expenseRepository.save(expenseToUpdate);
    }
    
    public void deleteExpense(Long id) {
    	expenseRepository.deleteById(id);
    }
}
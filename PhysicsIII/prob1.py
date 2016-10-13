#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 12 21:03:22 2016

Semi-empirical Mass Formula

@author: averykarlin
"""
def AZInput():
    A = float(input("Input the mass number, A:"))
    Z = float(input("Input the atomic number, Z:"))
    
    a1 = 15.8
    a2 = 18.3
    a3 = 0.714
    a4 = 23.2
    
    if A//2 != A/2:
        a5 = 0
    elif Z//2 != Z/2:
        a5 = 12.0
    else:
        a5 = -12.0
    
    B = a1*A - a2*A**(2/3) - a3*((Z**2)/(A**(1/3))) - a4*(((A-2*Z)**2)/(A)) + (a5/(A**(1/2)))
    
    print("\nB (MeV):",B)
    
    b = B/A
    
    print("\nB/A (MeV/atom)", b)

def ZInput():
    Z = float(input("Input the atomic number, Z:"))
    
    a1 = 15.8
    a2 = 18.3
    a3 = 0.714
    a4 = 23.2
    
    Amax = 0
    bmax = 0
    
    for A in range(int(Z), int(3*Z)):
        if A//2 != A/2:
            a5 = 0
        elif Z//2 != Z/2:
            a5 = 12.0
        else:
            a5 = -12.0
        
        B = a1*A - a2*A**(2/3) - a3*((Z**2)/(A**(1/3))) - a4*(((A-2*Z)**2)/(A)) + (a5/(A**(1/2)))
        b = B/A
        if b > bmax:
            bmax = b
            Amax = A
    
    print("\nMost Stable A (Atomic Mass):", Amax)
    print("\nMost Stable B/A (MeV/atom):", bmax)

def noInput():
    a1 = 15.8
    a2 = 18.3
    a3 = 0.714
    a4 = 23.2
    
    Ztot = 0
    btot = 0
    
    for Z in range(1, 100):
        Amax = 0
        bmax = 0
        for A in range(int(Z), int(3*Z)):
            if A//2 != A/2:
                a5 = 0
            elif Z//2 != Z/2:
                a5 = 12.0
            else:
                a5 = -12.0
            
            B = a1*A - a2*A**(2/3) - a3*((Z**2)/(A**(1/3))) - a4*(((A-2*Z)**2)/(A)) + (a5/(A**(1/2)))
            b = B/A
            if b > btot:
                btot = b
                Ztot = Z
            if b > bmax:
                bmax = b
                Amax = A
        
        print("\nMost Stable A (Atomic Mass) for Z =", Z, ":", Amax)
        print("\nMost Stable B/A (MeV/atom) for Z =", Z, ":", bmax)
    
    print("\nMost Stable Z (Atomic Number):", Ztot)

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from bs4 import BeautifulSoup
import time
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate('ServiceKey.json')
firebase_admin.initialize_app(cred)

db = firestore.client()
universities=db.collection("universities")

with open('Endowment Size.txt', 'r') as f:
    for line in f:
        university_name, endowment = line.strip().split(':', 1)
        doc_ref = universities.document(university_name)
        doc_ref.update({
                'endowment': endowment
            })
        
with open('AccRate and AvgCost.txt', 'r') as k:
    for line in k:
        university_name, location, rate, cost  = line.strip().split(':', 3)
        doc_ref = universities.document(university_name)
        doc_ref.update({
            'location': location,
            'rate': rate,
            'averagecost': cost,
        })

print("success")
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from bs4 import BeautifulSoup
import time
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Use a service account
cred = credentials.Certificate('ServiceKey.json')
firebase_admin.initialize_app(cred)

db = firestore.client()
universities=db.collection("universities")

with open('Avaliable Dates data.txt', 'r') as f:
    for line in f:
        ranking, university_name, url = line.strip().split(':', 2)
        if url == 'special':
            doc_ref = universities.document(university_name)
            doc_ref.update({
                'rank': ranking,
                'available_dates': "check",
            })
            continue
            

        driver = webdriver.Chrome()
        driver.get(url)
        time.sleep(2)
        available_dates = []
    
        
        
        #### 1st cycle
        html = driver.page_source
        soup = BeautifulSoup(html, 'html.parser')
        calendar_table = soup.find('table', {'class': 'ui-datepicker-calendar'})
        rows = calendar_table.find_all('tr')
        date_rows = rows[1:]
        title_div = soup.find('div', {'class': 'ui-datepicker-title'})
        month_year = title_div.get_text(strip=True)
        month=month_year[:-4]
        next_button = driver.find_element(By.XPATH, '//a[@class="ui-datepicker-next ui-corner-all"]')
        for row in date_rows:
            cells = row.find_all('td')
            for cell in cells:
                date = f"{month} {cell.text}"
                status_classes = ['unavailable', 'available']
                status = [c for c in cell['class'] if c in status_classes]
                status = status[0] if status else 'Not Scheduled'
                if status == "available":
                    available_dates.append(date)

        ### for debugging
        print("Rank: {}, Name :{} ".format(ranking, university_name))
        ### for debugging
        
        next_button.click()

        ### 2nd cycle
        html = driver.page_source
        soup = BeautifulSoup(html, 'html.parser')
        calendar_table = soup.find('table', {'class': 'ui-datepicker-calendar'})
        rows = calendar_table.find_all('tr')
        date_rows = rows[1:]
        title_div = soup.find('div', {'class': 'ui-datepicker-title'})
        month_year = title_div.get_text(strip=True)
        month=month_year[:-4]
        for row in date_rows:
            cells = row.find_all('td')
            for cell in cells:
                date = f"{month} {cell.text}"
                status_classes = ['unavailable', 'available']
                status = [c for c in cell['class'] if c in status_classes]
                status = status[0] if status else 'Not Scheduled'
                if status == "available":
                    available_dates.append(date)
        driver.quit()
        doc_ref = universities.document(university_name)
        doc_ref.update({
            'available_dates': available_dates,
            'website': url,
            'rank': ranking
        })


print('success')


      

        

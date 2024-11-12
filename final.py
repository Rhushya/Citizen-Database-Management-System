import streamlit as st
import pymysql
from datetime import date
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Connect to MySQL database
def create_connection():
    return pymysql.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
        cursorclass=pymysql.cursors.DictCursor
    )

# Homepage
def main():
    st.title("Citizen Database Management System")
    choice = st.sidebar.radio("Choose Operation", ["Admin Panel", "Citizen View", "Database Tables"])
    
    if choice == "Admin Panel":
        admin_options = st.sidebar.radio("Admin Actions", ["Create Citizen", "Update Citizen", "Delete Citizen"])
        
        if admin_options == "Create Citizen":
            handle_create_citizen()
        elif admin_options == "Update Citizen":
            handle_update_citizen()
        elif admin_options == "Delete Citizen":
            handle_delete_citizen()

    elif choice == "Citizen View":
        handle_citizen_view()
    
    elif choice == "Database Tables":
        handle_view_tables()

# Admin section for creating a new citizen
def handle_create_citizen():
    st.header("Admin Panel: Create Citizen")
    first_name = st.text_input("First Name")
    last_name = st.text_input("Last Name")
    min_date = date(1900, 1, 1)
    dob = st.date_input("Date of Birth", min_value=min_date)
    
    if st.button("Create Citizen"):
        if first_name and last_name and dob:
            conn = create_connection()
            with conn.cursor() as cursor:
                cursor.execute(
                    "INSERT INTO basic_info (first_name, last_name, dob) VALUES (%s, %s, %s)",
                    (first_name, last_name, dob)
                )
                conn.commit()
            st.success("Citizen created successfully!")
        else:
            st.error("Please fill in all fields.")

# Admin section for updating an existing citizen
def handle_update_citizen():
    st.header("Admin Panel: Update Citizen Information")
    citizen_id = st.number_input("Enter Citizen Unique ID", min_value=1, step=1)
    update_column = st.selectbox("Select Field to Update", ["first_name", "last_name", "dob"])
    new_value = st.text_input(f"Enter New Value for {update_column}")
    
    if st.button("Update Citizen"):
        if citizen_id and new_value:
            conn = create_connection()
            with conn.cursor() as cursor:
                cursor.execute(f"UPDATE basic_info SET {update_column}=%s WHERE unique_id=%s", (new_value, citizen_id))
                conn.commit()
            st.success("Citizen information updated successfully!")
        else:
            st.error("Please enter all required details.")

# Admin section for deleting a citizen
def handle_delete_citizen():
    st.header("Admin Panel: Delete Citizen Record")
    citizen_id = st.number_input("Enter Citizen Unique ID", min_value=1, step=1)
    
    if st.button("Delete Citizen"):
        if citizen_id:
            conn = create_connection()
            with conn.cursor() as cursor:
                cursor.execute("DELETE FROM basic_info WHERE unique_id=%s", (citizen_id,))
                conn.commit()
            st.success("Citizen record deleted successfully!")
        else:
            st.error("Please enter a valid Citizen ID.")

# Citizen section for viewing details
def handle_citizen_view():
    st.header("Citizen View")
    first_name = st.text_input("Enter First Name")
    last_name = st.text_input("Enter Last Name")
    phone_no = st.text_input("Enter Phone Number")
    credential_type = st.selectbox("Select Credential Type", [
        "address_info", "basic_info", "biometric_data", "contact_info",
        "driving_license_data", "emergency_contacts", "employment_info",
        "government_ids", "health_info", "passport_data", "voter_data"
    ])
    
    if st.button("Show Details"):
        if first_name and last_name and phone_no:
            conn = create_connection()
            with conn.cursor() as cursor:
                cursor.execute("""
                    SELECT basic_info.unique_id, basic_info.first_name, basic_info.last_name, contact_info.mobile_number 
                    FROM basic_info 
                    JOIN contact_info ON basic_info.unique_id = contact_info.unique_id 
                    WHERE basic_info.first_name = %s AND basic_info.last_name = %s AND contact_info.mobile_number = %s
                """, (first_name, last_name, phone_no))
                citizen = cursor.fetchone()
                
                if citizen:
                    unique_id = citizen['unique_id']
                    cursor.execute(f"SELECT * FROM {credential_type} WHERE unique_id=%s", (unique_id,))
                    data = cursor.fetchone()
                    if data:
                        st.write(f"{credential_type.capitalize()} Information:")
                        st.json(data)
                    else:
                        st.error(f"No data found in {credential_type}.")
                else:
                    st.error("Citizen not found or details do not match.")
        else:
            st.error("Please enter all required details.")

# Function to display entire database tables
def handle_view_tables():
    st.header("Database Tables Viewer")
    table = st.selectbox("Select Table to View", [
        "basic_info", "contact_info", "address_info", "biometric_data", 
        "government_ids", "passport_data", "driving_license_data", 
        "voter_data", "employment_info", "health_info", "emergency_contacts"
    ])
    
    if st.button("View Table"):
        conn = create_connection()
        with conn.cursor() as cursor:
            cursor.execute(f"SELECT * FROM {table}")
            data = cursor.fetchall()
            if data:
                st.write(f"Displaying records from `{table}` table:")
                st.dataframe(data)
            else:
                st.error(f"No data found in `{table}` table.")

if __name__ == "__main__":
    main()
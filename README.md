
This is a Java-based web application developed using **Servlets** and **JSP**, designed for tracking buses. It runs on **Apache Tomcat** and is built using **JDK 8+**.

---

## 🧰 Requirements

- JDK 8 or higher  
- Apache Tomcat 10 or higher  
- Eclipse IDE (or any Java IDE that supports Dynamic Web Projects)

---

## 🚀 How to Run the Project (Step-by-Step)

### 🔹 Step 1: Clone or Download the Project

Download the ZIP from GitHub or clone it using:

```bash
git clone https://github.com/kartik-sahu-dev/2021-25-MIP2-G18_TRANSPORT_MANAGEMENT_SYSTEM.git
```

---

### 🔹 Step 2: Open the Project in Eclipse

1. Launch **Eclipse IDE**.
2. Go to:  
   `File` → `Import` → `Existing Projects into Workspace`
3. Click `Browse`, select the project folder you cloned/downloaded.
4. Make sure the project is detected as a **Dynamic Web Project**.
5. Click `Finish`.

---

### 🔹 Step 3: Configure Apache Tomcat in Eclipse

1. Go to:  
   `Window` → `Preferences` → `Server` → `Runtime Environments`
2. Click **Add**.
3. Select **Apache Tomcat v9.0**, then click `Next`.
4. Browse to your **Tomcat installation folder**.
5. Click **Finish** to complete setup.

---

### 🔹 Step 4: Add Tomcat Server and Deploy Project

1. Go to the **Servers** tab (bottom panel in Eclipse).  
   *(If it's not visible, open it from `Window` → `Show View` → `Servers`)*
2. Click **Create a new server**.
3. Choose **Apache Tomcat v10.0 Server**.
4. Add your project to the server.
5. Click **Finish**.

---

### 🔹 Step 5: Run the Project on Server

1. Right-click on your project in Project Explorer.
2. Select:  
   `Run As` → `Run on Server`
3. Choose the **Tomcat server** you configured.
4. Eclipse will build and deploy the project automatically.

---

### 🔹 Step 6: Open the Web App in Browser

Once the server is running, open your browser and go to:

```
http://localhost:8080/
```

## 📁 What’s Included in This Repo

- ✅ Servlet and JSP source code
- ✅ WebContent (JSPs, static files, `WEB-INF/web.xml`)
- ✅ Required configuration files
- ✅ README with complete setup instructions

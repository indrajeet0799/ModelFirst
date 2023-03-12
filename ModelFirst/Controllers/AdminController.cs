using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace ModelFirst.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin


        RahitechEntyModelContainer context =new RahitechEntyModelContainer();                                

        
        public ActionResult Index() 
        { 

            var empList=context.Employees.ToList();
            return View(empList);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Company obj)
        {
            context.Companies.Add(obj);
            context.SaveChanges();
            return RedirectToAction("Create");
        }
        public ActionResult Delete(int Id)
        {
            var row= context.Employees.Where(model=> model.EmpId== Id).FirstOrDefault();
            context.Employees.Remove(row);
            context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult CreateEmployee()
        {
            ViewBag.ComId = new SelectList(context.Companies, "ComId", "CompanyName");
            return View();
        }
        [HttpPost]
        public ActionResult CreateEmployee(Employee obj)
        {
            {
                context.Employees.Add(obj);
                context.SaveChanges();
                return RedirectToAction("Index");

            }
            ViewBag.ComId = new SelectList(context.Companies, "ComId", "CompanyName", obj.ComId);
            return View(obj);
        }

        [HttpGet]
        public ActionResult Edit(int Id)
        {
            var emp = context.Employees.Find(Id);
            ViewBag.ComId = new SelectList(context.Companies, "ComId", "CompanyName");
            //RahitechEntyModelContainer obj = new RahitechEntyModelContainer();
            //Employee employee=obj.Employees.Single(x=>x.EmpId==Id);

            return View(emp);
        }
        [HttpPost]
        public ActionResult Edit(Employee emp)
        {
           if(ModelState.IsValid)
            {
                context.Entry(emp).State=EntityState.Modified;
                context.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(emp);
        }    
        public ActionResult Detail(int Id)
        {
            var emp = context.Employees.Find(Id);
            return PartialView("Detail",emp);
        }
        public ActionResult Detailview(int Id)
        {
            var emp = context.Employees.Find(Id);
            return PartialView("Detail", emp);
        }







    }
}
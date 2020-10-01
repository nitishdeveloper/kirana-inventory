package com.kirana.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kirana.model.Product;
import com.kirana.service.ProductService;

@Controller
@RequestMapping("/bulk")
public class ExcelUploadController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String processExcel(@RequestParam("bulkUpload")MultipartFile fileUpload) {		
		try {
			List<Product> productlist = new ArrayList<Product>();
			int i = 0;
			if (fileUpload != null) {
				XSSFWorkbook workbook = new XSSFWorkbook(fileUpload.getInputStream());
				System.out.println(workbook.getWorkbookType().getContentType());
				XSSFSheet worksheet = workbook.getSheetAt(0);
				while (i <= worksheet.getLastRowNum()) {
					Product product = new Product();
					XSSFRow row = worksheet.getRow(i++);
					product.setProductId((long) row.getCell(0).getNumericCellValue());
					product.setProductName(row.getCell(1).getStringCellValue());
					product.setBrandName(row.getCell(2).getStringCellValue());
					product.setQuantity((long)row.getCell(3).getNumericCellValue());
					product.setCategoryName(row.getCell(4).getStringCellValue());
					product.setActualPrice((double)row.getCell(5).getNumericCellValue());
					product.setMarketPrice((double) row.getCell(6).getNumericCellValue());
					product.setStatus((short) row.getCell(7).getNumericCellValue());
					productlist.add(product);
				}
//				productService
				workbook.close();
				return "Ok";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "error";
	}
}

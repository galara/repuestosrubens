/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package reporte;

import Modelos.FormatoFecha;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JOptionPane;

/**
 *
 * @author Glara
 */
public class ReporteComprasOpciones extends javax.swing.JInternalFrame {

    /**
     * Creates new form reporteventa
     */
    public ReporteComprasOpciones() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jcMousePanel1 = new jcMousePanel.jcMousePanel();
        jLabel1 = new javax.swing.JLabel();
        vencidosdetalle = new javax.swing.JRadioButton();
        todosvencidosdetalle = new javax.swing.JRadioButton();
        buttonGenerarReporte = new elaprendiz.gui.button.ButtonAction();

        setClosable(true);
        setTitle("Compras");
        setName("ReporteComprasOpciones"); // NOI18N

        jcMousePanel1.setBackground(new java.awt.Color(204, 204, 204));
        jcMousePanel1.setColor1(new java.awt.Color(204, 204, 204));
        jcMousePanel1.setColor2(new java.awt.Color(0, 153, 153));
        jcMousePanel1.setModo(2);
        jcMousePanel1.setName(""); // NOI18N

        jLabel1.setBackground(new java.awt.Color(57, 104, 163));
        jLabel1.setFont(new java.awt.Font("Times New Roman", 2, 34)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Compras al Crédito");
        jLabel1.setOpaque(true);

        vencidosdetalle.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        vencidosdetalle.setSelected(true);
        vencidosdetalle.setText("Creditos Vencidos");
        vencidosdetalle.setOpaque(false);
        vencidosdetalle.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                vencidosdetalleActionPerformed(evt);
            }
        });

        todosvencidosdetalle.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        todosvencidosdetalle.setText("Todos los creditos");
        todosvencidosdetalle.setOpaque(false);
        todosvencidosdetalle.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                todosvencidosdetalleActionPerformed(evt);
            }
        });

        buttonGenerarReporte.setText("Generar Reporte");
        buttonGenerarReporte.setFont(new java.awt.Font("Arial", 1, 13)); // NOI18N
        buttonGenerarReporte.setName("Pensum Principal"); // NOI18N
        buttonGenerarReporte.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jcMousePanel1Layout = new javax.swing.GroupLayout(jcMousePanel1);
        jcMousePanel1.setLayout(jcMousePanel1Layout);
        jcMousePanel1Layout.setHorizontalGroup(
            jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(jcMousePanel1Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addGroup(jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(vencidosdetalle, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(todosvencidosdetalle, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(buttonGenerarReporte, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jcMousePanel1Layout.setVerticalGroup(
            jcMousePanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jcMousePanel1Layout.createSequentialGroup()
                .addComponent(jLabel1)
                .addGap(68, 68, 68)
                .addComponent(vencidosdetalle)
                .addGap(14, 14, 14)
                .addComponent(todosvencidosdetalle)
                .addGap(18, 18, 18)
                .addComponent(buttonGenerarReporte, javax.swing.GroupLayout.PREFERRED_SIZE, 43, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(25, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jcMousePanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jcMousePanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        String nombrereporte = "";
        if (vencidosdetalle.isSelected() == true || todosvencidosdetalle.isSelected() == true ) {
            if (vencidosdetalle.isSelected() == true) {
                Calendar dcFech = Calendar.getInstance();
                String fecha = FormatoFecha.getFormato(dcFech.getTime(), FormatoFecha.A_M_D);;
                nombrereporte = "creditosvencidosprov.jasper";
                Map parametro = new HashMap();
                parametro.put("defecha", fecha);
                GeneraReportes.AbrirReporte(nombrereporte, parametro);
            } else if (todosvencidosdetalle.isSelected() == true) {
                nombrereporte = "creditosvencidosprov2.jasper";
                GeneraReportes.AbrirReporte(nombrereporte, null);
            } 
//            else if (vencidosconsolidado.isSelected() == true) {
//                nombrereporte = "RepSaldoClientes.jasper";
//                GeneraReportes.AbrirReporte(nombrereporte, null);
//            }
        } else {
            JOptionPane.showMessageDialog(this, "Debe seleccionar una Opcion");
        }

    }//GEN-LAST:event_jButton1ActionPerformed

    private void vencidosdetalleActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_vencidosdetalleActionPerformed
        // TODO add your handling code here:
        if (vencidosdetalle.isSelected() == true) {
            todosvencidosdetalle.setSelected(false);
            //vencidosconsolidado.setSelected(false);
        }
    }//GEN-LAST:event_vencidosdetalleActionPerformed

    private void todosvencidosdetalleActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_todosvencidosdetalleActionPerformed
        // TODO add your handling code here:
        if (todosvencidosdetalle.isSelected() == true) {
            vencidosdetalle.setSelected(false);
            //vencidosconsolidado.setSelected(false);
        } else {
        }
    }//GEN-LAST:event_todosvencidosdetalleActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private elaprendiz.gui.button.ButtonAction buttonGenerarReporte;
    private javax.swing.JLabel jLabel1;
    private jcMousePanel.jcMousePanel jcMousePanel1;
    private javax.swing.JRadioButton todosvencidosdetalle;
    private javax.swing.JRadioButton vencidosdetalle;
    // End of variables declaration//GEN-END:variables
}
